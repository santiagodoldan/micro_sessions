module MicroSession
  class Store
    delegate :empty?, :to_h, :to_hash, :inspect, to: :data

    def initialize(controller)
      @controller = controller
    end

    def data
      @controller.session[MicroSession.key] ||= {}
      @controller.session[MicroSession.key][id] ||= {}
      @controller.session[MicroSession.key][id].symbolize_keys!
    end

    def [](key)
      data[key.to_sym]
    end

    def []=(key, value)
      data[key.to_sym] = value
    end

    def url_options
      if empty?
        {}
      else
        { MicroSession.param => id }
      end
    end

    def id
      @id ||= id_from_params || generate_id
    end

    private

    def id_from_params
      @controller.params[MicroSession.param] if @controller.params
    end

    def generate_id
      case MicroSession.param_type
      when :hash
        secure_random.hex(MicroSession.length / 2)
      when :integer
        self.counter += 1
      when :random_integer
        secure_random.integer
      end
    end

    def secure_random
      if Object.const_defined?('SecureRandom')
        SecureRandom
      else
        ActiveSupport::SecureRandom
      end
    end
  end
end
