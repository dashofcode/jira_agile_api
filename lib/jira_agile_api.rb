require 'jira_agile_api/version'

# dependencies
require 'virtus'
require 'faraday'
require 'faraday_middleware'

# stdlib
require 'addressable/uri'
require 'forwardable'
require 'logger'

module JiraAgileApi
  autoload :Error, 'jira_agile_api/error'
  autoload :Client, 'jira_agile_api/client'
  autoload :Logger, 'jira_agile_api/logger'

  module Errors
    class UnexpectedData < StandardError; end
  end

  module Endpoints
    autoload :Backlog, 'jira_agile_api/endpoints/backlog'
    autoload :RapidView, 'jira_agile_api/endpoints/rapid_view'
    autoload :RapidViews, 'jira_agile_api/endpoints/rapid_views'
    autoload :SprintReport, 'jira_agile_api/endpoints/sprint_report'
    autoload :Sprints, 'jira_agile_api/endpoints/sprints'
  end

  module Resources
    autoload :Backlog, 'jira_agile_api/resources/backlog'
    autoload :Epic, 'jira_agile_api/resources/epic'
    autoload :EstimateStatistic, 'jira_agile_api/resources/estimate_statistic'
    autoload :EstimateSum, 'jira_agile_api/resources/estimate_sum'
    autoload :Issue, 'jira_agile_api/resources/issue'
    autoload :Project, 'jira_agile_api/resources/project'
    autoload :RapidView, 'jira_agile_api/resources/rapid_view'
    autoload :Sprint, 'jira_agile_api/resources/sprint'
    autoload :SprintReport, 'jira_agile_api/resources/sprint_report'
    autoload :Status, 'jira_agile_api/resources/status'
    autoload :Version, 'jira_agile_api/resources/version'
  end
end
