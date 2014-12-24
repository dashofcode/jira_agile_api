module JiraAgileApi
  module Resources
    class Issue
      include Virtus.model

      attribute :client

      attribute :id, Integer
      attribute :key, String
      attribute :hidden, Boolean
      attribute :summary, String
      attribute :typeName, String
      attribute :typeId, String
      attribute :typeUrl, String
      attribute :priorityUrl, String
      attribute :priorityName, String
      attribute :done, Boolean
      attribute :assignee, String
      attribute :assigneeName, String
      attribute :avatarUrl, String
      attribute :color, String
      attribute :statusId, String
      attribute :statusName, String
      attribute :statusUrl, String
      attribute :status, JiraAgileApi::Resources::Status
      attribute :fixVersions, Array[Integer]
      attribute :projectId, Integer
      # attribute :epic, String
      attribute :epic_key, String
      attribute :estimateStatistic, JiraAgileApi::Resources::EstimateStatistic
      attribute :hasCustomUserAvatar, Boolean
      attribute :linkedPagesCount, Integer


      # Epic key comes in as "epic" so override setter and store the key
      def epic=(key)
        self.epic_key = key
      end

      def epic
        # TODO: use epic_key to retrieve epic object
      end

      # TODO: get issue labels.
    end
  end
end
