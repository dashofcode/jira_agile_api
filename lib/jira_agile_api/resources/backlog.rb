module JiraAgileApi
  module Resources
    class Backlog
      include Virtus.model(strict: false)

      attribute :client

      attribute :issues, Array[JiraAgileApi::Resources::Issue]
      attribute :backlogIssues, Array[JiraAgileApi::Resources::Issue]
      attribute :rankCustomFieldId, Integer
      attribute :sprints, Array[JiraAgileApi::Resources::Sprint]
      attribute :projects, Array[JiraAgileApi::Resources::Project]
      attribute :epics, Array[JiraAgileApi::Resources::Epic]
      attribute :canEditEpics, Boolean
      attribute :canManageSprints, Boolean
      attribute :maxIssuesExceeded, Boolean
      attribute :queryResultLimit, Integer
      # TODO: The items in the Array are not getting coerced to Version objects
      attribute :versionsPerProject, Hash[String => Array[JiraAgileApi::Resources::Version]]
      attribute :canCreateVersion, Boolean
      attribute :sprintMarkersMigrated, Boolean

      def epicData=(data)
        self.epics        = data['epics']
        self.canEditEpics = data['canEditEpics']
      end

      def versionData=(data)
        self.versionsPerProject = data['versionsPerProject']
        self.canCreateVersion   = data['canCreateVersion']
      end

      #   TODO
      #   determining which issues are actually in the backlog vs the sprints
      #   fill in the issues into the single sprints and the backlog issue list respectively

    end
  end
end
