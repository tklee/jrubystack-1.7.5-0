module ArJdbc
  module MySQL

    # @see ActiveRecord::ConnectionAdapters::JdbcColumn#column_types
    def self.column_selector
      [ /mysql/i, lambda { |config, column| column.extend(Column) } ]
    end

    # Column behavior based on (abstract) MySQL adapter in Rails.
    # @see ActiveRecord::ConnectionAdapters::JdbcColumn
    module Column

      attr_reader :collation, :strict, :extra

      def extract_default(default)
        if sql_type =~ /blob/i || type == :text
          if default.blank?
            return null ? nil : ''
          else
            raise ArgumentError, "#{type} columns cannot have a default value: #{default.inspect}"
          end
        elsif missing_default_forged_as_empty_string?(default)
          nil
        else
          super
        end
      end

      def has_default?
        return false if sql_type =~ /blob/i || type == :text #mysql forbids defaults on blob and text columns
        super
      end

      def simplified_type(field_type)
        if adapter && adapter.emulate_booleans?
          return :boolean if field_type.downcase.index('tinyint(1)')
        end

        case field_type
        when /enum/i, /set/i then :string
        when /year/i then :integer
        # :tinyint : {:name=>"tinyint", :limit=>3}
        # :"tinyint unsigned" : {:name=>"tinyint unsigned", :limit=>3}
        # :bigint : {:name=>"bigint", :limit=>19}
        # :"bigint unsigned" : {:name=>"bigint unsigned", :limit=>20}
        # :integer : {:name=>"integer", :limit=>10}
        # :"integer unsigned" : {:name=>"integer unsigned", :limit=>10}
        # :int : {:name=>"int", :limit=>10}
        # :"int unsigned" : {:name=>"int unsigned", :limit=>10}
        # :mediumint : {:name=>"mediumint", :limit=>7}
        # :"mediumint unsigned" : {:name=>"mediumint unsigned", :limit=>8}
        # :smallint : {:name=>"smallint", :limit=>5}
        # :"smallint unsigned" : {:name=>"smallint unsigned", :limit=>5}
        when /int/i then :integer
        when /double/i then :float # double precision (alias)
        when 'bool' then :boolean
        when 'char' then :string
        # :mediumtext => {:name=>"mediumtext", :limit=>16777215}
        # :longtext => {:name=>"longtext", :limit=>2147483647}
        # :text => {:name=>"text"}
        # :tinytext => {:name=>"tinytext", :limit=>255}
        when /text/i then :text
        when 'long varchar' then :text
        # :"long varbinary" => {:name=>"long varbinary", :limit=>16777215}
        # :varbinary => {:name=>"varbinary", :limit=>255}
        when /binary/i then :binary
        # :mediumblob => {:name=>"mediumblob", :limit=>16777215}
        # :longblob => {:name=>"longblob", :limit=>2147483647}
        # :blob => {:name=>"blob", :limit=>65535}
        # :tinyblob => {:name=>"tinyblob", :limit=>255}
        when /blob/i then :binary
        when /^bit/i then :binary
        else
          super
        end
      end

      def extract_limit(sql_type)
        case sql_type
        when /blob|text/i
          case sql_type
          when /tiny/i
            255
          when /medium/i
            16777215
          when /long/i
            2147483647 # mysql only allows 2^31-1, not 2^32-1, somewhat inconsistently with the tiny/medium/normal cases
          else
            super # we could return 65535 here, but we leave it undecorated by default
          end
        when /^bigint/i;    8
        when /^int/i;       4
        when /^mediumint/i; 3
        when /^smallint/i;  2
        when /^tinyint/i;   1
        when /^enum\((.+)\)/i # 255
          $1.split(',').map{ |enum| enum.strip.length - 2 }.max
        when /^(bool|date|float|int|time)/i
          nil
        else
          super
        end
      end

      # MySQL misreports NOT NULL column default when none is given.
      # We can't detect this for columns which may have a legitimate ''
      # default (string) but we can for others (integer, datetime, boolean,
      # and the rest).
      #
      # Test whether the column has default '', is not null, and is not
      # a type allowing default ''.
      def missing_default_forged_as_empty_string?(default)
        type != :string && !null && default == ''
      end

      def adapter; end
      private :adapter

    end

    # @private backwards-compatibility
    ColumnExtensions = Column

  end
end