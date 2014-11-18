# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jira_agile_api/version'

Gem::Specification.new do |spec|
  spec.name        = 'jira_agile_api'
  spec.version     = JiraAgileApi::VERSION
  spec.authors     = ['Forest Carlisle']
  spec.email       = ['forestcarlisle@gmail.com']
  spec.summary     = %q{API client for the Jira Agile JSON API}
  spec.description = %q{This gem allows you to easily use the Jira Agile JSON API.}
  spec.homepage    = 'https://github.com/dashofcode/jira_agile_api'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'multi_json'

  spec.add_dependency 'addressable'
  spec.add_dependency 'virtus'
  spec.add_dependency 'faraday', '~> 0.9.0'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'excon'
end
