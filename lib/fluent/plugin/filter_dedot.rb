module Fluent
  class DedotFilter < Fluent::Filter

    Fluent::Plugin.register_filter('dedot', self)

    config_param :de_dot, :bool, default: true
    config_param :de_dot_separator, :string, default: '_'

    def initialize
      super
    end

    def configure(conf)
      super

      if @de_dot && @de_dot_separator.include?(".")
        raise Fluent::ConfigError, "Invalid de_dot_separator: cannot be or contain '.'"
      end
    end

    def filter(tag, time, record)
      begin
        de_dot(record) if @de_dot
      rescue => e
        router.emit_error_event(tag, time, record, e)
      end
    end

    def de_dot(record)
      newrecord = {}

      record.each do |key, value|
        newkey = key.gsub(/\./, @de_dot_separator)
        newrecord[newkey] = value
      end

      newrecord
    end

  end
end
