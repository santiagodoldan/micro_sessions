# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'micro_session/version'

Gem::Specification.new do |spec|
  spec.name        = 'micro_sessions'
  spec.version     = MicroSession::VERSION
  spec.authors     = ['Ben Hughes', 'Santiago Doldan']
  spec.email       = 'santiagodolte@gmail.com'
  spec.homepage    = 'http://github.com/santiagodoldan/micro_sessions'
  spec.summary     = 'Keyed sessions within the global sessions object.'
  spec.description = "Provides 'micro-sessions' within the global sessions object keyed off an identifier."

  spec.license = 'MIT'

  spec.files        = Dir['{lib,spec}/**/*', '[A-Z]*']
  spec.require_path = %w(lib)

  spec.required_ruby_version = '>= 2.0'
  spec.required_rubygems_version = '>= 1.3.5'

  spec.add_dependency 'rails', ['>= 3.0', '<= 5.1']
end
