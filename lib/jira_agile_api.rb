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
    autoload :RapidViews, 'jira_agile_api/endpoints/rapid_views'
    # autoload :Epic, 'jira_agile_api/endpoints/epic'
    # autoload :Epics, 'jira_agile_api/endpoints/epics'
    # autoload :Iterations, 'jira_agile_api/endpoints/iterations'
    # autoload :Me, 'jira_agile_api/endpoints/me'
    # autoload :Memberships, 'jira_agile_api/endpoints/memberships'
    # autoload :Project, 'jira_agile_api/endpoints/project'
    # autoload :Projects, 'jira_agile_api/endpoints/projects'
    # autoload :Stories, 'jira_agile_api/endpoints/stories'
    # autoload :Story, 'jira_agile_api/endpoints/story'
    # autoload :Tasks, 'jira_agile_api/endpoints/tasks'
  end

  module Resources
    # autoload :Account, 'jira_agile_api/resources/account'
    # autoload :Epic, 'jira_agile_api/resources/epic'
    # autoload :Sprint, 'jira_agile_api/resources/sprint'
    # autoload :Me, 'jira_agile_api/resources/me'
    # autoload :MembershipSummary, 'jira_agile_api/resources/membership_summary'
    # autoload :Label, 'jira_agile_api/resources/label'
    # autoload :Person, 'jira_agile_api/resources/person'
    # autoload :Project, 'jira_agile_api/resources/project'
    # autoload :ProjectMembership, 'jira_agile_api/resources/project_membership'
    autoload :RapidView, 'jira_agile_api/resources/rapid_view'
    autoload :Issue, 'jira_agile_api/resources/issue'
    autoload :EstimateStatistic, 'jira_agile_api/resources/estimate_statistic'
    # autoload :Task, 'jira_agile_api/resources/task'
    # autoload :TimeZone, 'jira_agile_api/resources/time_zone'
  end
end
