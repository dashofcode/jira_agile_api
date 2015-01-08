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
      attribute :estimateStatistic, JiraAgileApi::Resources::EstimateStatistic
      attribute :hasCustomUserAvatar, Boolean
      attribute :linkedPagesCount, Integer

      attr_reader :epic, :epic_key

      def initialize(attrs)
        # Epic key comes in as "epic" so just store the key
        @epic_key = attrs.delete('epic')

        super(attrs)
      end

      def epic=(epic)
        raise ArgumentError, 'Epic not of expected type' unless epic.kind_of? JiraAgileApi::Resources::Epic
        @epic = epic
      end

      def epic
        return @epic unless @epic.nil?

        if @epic_key
          # TODO: get epic from key
        end
      end

      # TODO: get issue labels.
    end
  end
end
