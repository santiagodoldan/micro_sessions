module MicroSession
  class << self
    alias configure tap

    mattr_accessor :param, :key, :param_type, :length, :counter

    self.param = '_msid'
    self.key = '_micro_sessions'
    self.param_type = :hash
    self.length = 11
    self.counter = 2

    def options
      { param: param, key: key, param_type: param_type, length: length, counter: counter }
    end
  end

  class Engine < ::Rails::Engine
  end
end
