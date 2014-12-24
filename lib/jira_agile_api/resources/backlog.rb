module JiraAgileApi
  module Resources
    class Backlog
      include Virtus.model

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
      attribute :versionsPerProject, Hash[String => Array[JiraAgileApi::Resources::Version]]
      attribute :canCreateVersion, Boolean
      attribute :sprintMarkersMigrated, Boolean

      def initialize(attrs)
        super(attrs)

        coerce_issues
      end

      def epicData=(data)
        self.epics        = data['epics']
        self.canEditEpics = data['canEditEpics']
      end

      def versionData=(data)
        self.versionsPerProject = data['versionsPerProject']
        self.canCreateVersion   = data['canCreateVersion']

        coerce_versions_per_project
      end

      private

      # Determining which issues are actually in the backlog vs the sprints.
      # Put issues into each sprint and the backlog issue lists respectively.
      def coerce_issues

      end

      # HACK: The items in the Array are not getting coerced to Version objects
      # by Virtus. I think this is a bug or just unsupported feature for Hash coercion.
      def coerce_versions_per_project
        versionsPerProject.each do |_, versions|
          versions.each_with_index do |version_hash, idx|
            versions[idx] = JiraAgileApi::Resources::Version.new(version_hash)
          end
        end
      end

    end
  end
end
