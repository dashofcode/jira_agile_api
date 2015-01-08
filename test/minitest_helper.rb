$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'coveralls'
Coveralls.wear!

require 'minitest/byebug' if ENV['DEBUG']
require 'minitest/autorun'
require 'awesome_print'
require 'multi_json'
require 'vcr'

require 'jira_agile_api'

Dir[File.expand_path('../{support,shared}/**/*.rb', __FILE__)].each { |f| require f }

VCR.configure do |c|
  c.ignore_localhost         = false
  c.cassette_library_dir     = File.expand_path('../vcr/cassettes', __FILE__).to_s
  c.default_cassette_options = { serialize_with: :json }
  c.hook_into :excon
  c.allow_http_connections_when_no_cassette = false
end

LOGGER        = ::Logger.new(STDOUT)
JIRA_URL      = ENV['JIRA_URL'] || 'http://localhost:8080'
JIRA_USERNAME = ENV['JIRA_USERNAME'] || 'fcarlisle'
JIRA_PASSWORD = ENV['JIRA_PASSWORD'] || 'test1234'
