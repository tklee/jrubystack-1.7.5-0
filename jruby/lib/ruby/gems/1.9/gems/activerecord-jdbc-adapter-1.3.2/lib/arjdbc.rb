if defined?(JRUBY_VERSION)
  begin
    require 'active_record/version'
    if ActiveRecord::VERSION::MAJOR < 2
      if defined?(RAILS_CONNECTION_ADAPTERS)
        RAILS_CONNECTION_ADAPTERS << %q(jdbc)
      else
        RAILS_CONNECTION_ADAPTERS = %w(jdbc)
      end
    else
      require 'active_record'
    end
  rescue LoadError => e
    warn "activerecord-jdbc-adapter requires the activerecord gem at runtime"
    raise e
  end
  require 'arjdbc/jdbc'
  begin
    require 'arjdbc/railtie'
  rescue LoadError => e
    warn "activerecord-jdbc-adapter failed to load railtie: #{e.inspect}"
  end if defined?(Rails) && ActiveRecord::VERSION::MAJOR >= 3
else
  warn "activerecord-jdbc-adapter is for use with JRuby only"
end

require 'arjdbc/version'
