module ArJdbc
  module MSSQL
    module LimitHelpers

      # @private
      FIND_SELECT = /\b(SELECT(\s+DISTINCT)?)\b(.*)/mi

      module SqlServerReplaceLimitOffset

        module_function

        def replace_limit_offset!(sql, limit, offset, order)
          if limit
            offset ||= 0
            start_row, end_row = offset + 1, offset + limit.to_i

            if match = FIND_SELECT.match(sql)
              select, distinct, rest_of_query = match[1], match[2], match[3]
              rest_of_query.strip!
            end
            rest_of_query[0] = '*' if rest_of_query[0...1] == '1' && rest_of_query !~ /1 AS/i
            if rest_of_query[0...1] == '*'
              from_table = Utils.get_table_name(rest_of_query, true)
              rest_of_query = "#{from_table}.#{rest_of_query}"
            end

            if distinct # select =~ /DISTINCT/i
              order = order.gsub(/([a-z0-9_])+\./, 't.')
              new_sql = "SELECT t.* FROM "
              new_sql << "( SELECT ROW_NUMBER() OVER(#{order}) AS _row_num, t.* FROM (#{select} #{rest_of_query}) AS t ) AS t"
              new_sql << " WHERE t._row_num BETWEEN #{start_row} AND #{end_row}"
            else
              new_sql = "#{select} t.* FROM "
              new_sql << "( SELECT ROW_NUMBER() OVER(#{order}) AS _row_num, #{rest_of_query} ) AS t"
              new_sql << " WHERE t._row_num BETWEEN #{start_row} AND #{end_row}"
            end

            sql.replace(new_sql)
          end
          sql
        end

      end

      module SqlServer2000ReplaceLimitOffset

        module_function

        def replace_limit_offset!(sql, limit, offset, order)
          if limit
            offset ||= 0
            start_row = offset + 1
            end_row = offset + limit.to_i
            
            if match = FIND_SELECT.match(sql)
              select, distinct, rest_of_query = match[1], match[2], match[3]
            end
            #need the table name for avoiding amiguity
            table_name  = Utils.get_table_name(sql, true)
            primary_key = get_primary_key(order, table_name)

            #I am not sure this will cover all bases.  but all the tests pass
            if order[/ORDER/].nil?
              new_order = "ORDER BY #{order}, [#{table_name}].[#{primary_key}]" if order.index("#{table_name}.#{primary_key}").nil?
            else
              new_order ||= order
            end

            if (start_row == 1) && (end_row ==1)
              new_sql = "#{select} TOP 1 #{rest_of_query} #{new_order}"
              sql.replace(new_sql)
            else
              # We are in deep trouble here. SQL Server does not have any kind of OFFSET build in.
              # Only remaining solution is adding a where condition to be sure that the ID is not in SELECT TOP OFFSET FROM SAME_QUERY.
              # To do so we need to extract each part of the query to insert our additional condition in the right place.
              query_without_select = rest_of_query[/FROM/i=~ rest_of_query.. -1]
              additional_condition = "#{table_name}.#{primary_key} NOT IN (#{select} TOP #{offset} #{table_name}.#{primary_key} #{query_without_select} #{new_order})"

              # Extract the different parts of the query
              having, group_by, where, from, selection = split_sql(rest_of_query, /having/i, /group by/i, /where/i, /from/i)

              # Update the where part to add our additional condition
              if where.blank?
                where = "WHERE #{additional_condition}"
              else
                where = "#{where} AND #{additional_condition}"
              end

              # Replace the query to be our new customized query
              sql.replace("#{select} TOP #{limit} #{selection} #{from} #{where} #{group_by} #{having} #{new_order}")
            end
          end
          sql
        end

        # Split the rest_of_query into chunks based on regexs (applied from end of string to the beginning)
        # The result is an array of regexs.size+1 elements (the last one being the remaining once everything was chopped away)
        def split_sql(rest_of_query, *regexs)
          results = Array.new

          regexs.each do |regex|
            if position = (regex =~ rest_of_query)
              # Extract the matched string and chop the rest_of_query
              matched       = rest_of_query[position..-1]
              rest_of_query = rest_of_query[0...position]
            else
              matched = nil
            end

            results << matched
          end
          results << rest_of_query

          results
        end

        def get_primary_key(order, table_name) # table_name might be quoted
          if order =~ /(\w*id\w*)/i
            $1
          else
            unquoted_name = Utils.unquote_table_name(table_name)
            model = descendants.find { |m| m.table_name == table_name || m.table_name == unquoted_name }
            model ? model.primary_key : 'id'
          end
        end

        private

        if ActiveRecord::VERSION::MAJOR >= 3
          def descendants; ::ActiveRecord::Base.descendants; end
        else
          def descendants; ::ActiveRecord::Base.send(:subclasses) end
        end

      end

      private

      if ::ActiveRecord::VERSION::MAJOR < 3

        def setup_limit_offset!(version = nil)
          if version.to_s == '2000' || sqlserver_2000?
            extend SqlServer2000AddLimitOffset
          else
            extend SqlServerAddLimitOffset
          end
        end

      else

        def setup_limit_offset!(version = nil); end

      end

      # @private
      module SqlServerAddLimitOffset

        # @note Only needed with (non-AREL) ActiveRecord **2.3**.
        # @see Arel::Visitors::SQLServer
        def add_limit_offset!(sql, options)
          if options[:limit]
            order = "ORDER BY #{options[:order] || determine_order_clause(sql)}"
            sql.sub!(/ ORDER BY.*$/i, '')
            SqlServerReplaceLimitOffset.replace_limit_offset!(sql, options[:limit], options[:offset], order)
          end
        end

      end if ::ActiveRecord::VERSION::MAJOR < 3

      # @private
      module SqlServer2000AddLimitOffset

        # @note Only needed with (non-AREL) ActiveRecord **2.3**.
        # @see Arel::Visitors::SQLServer
        def add_limit_offset!(sql, options)
          if options[:limit]
            order = "ORDER BY #{options[:order] || determine_order_clause(sql)}"
            sql.sub!(/ ORDER BY.*$/i, '')
            SqlServer2000ReplaceLimitOffset.replace_limit_offset!(sql, options[:limit], options[:offset], order)
          end
        end

      end if ::ActiveRecord::VERSION::MAJOR < 3

    end
  end
end
