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
      attribute :colour, String
      attribute :statusId, String
      attribute :statusName, String
      attribute :statusUrl, String
      attribute :fixVersions, Array[Integer]
      attribute :projectId, Integer
      attribute :epic, String
      attribute :estimateStatistic, JiraAgileApi::Resources::EstimateStatistic

      # # @return [String] Comma separated list of labels.
      # def label_list
      #   @label_list ||= labels.collect(&:name).join(',')
      # end
      #
      # def tasks(params = {})
      #   if @tasks.any?
      #     @tasks
      #   else
      #     @tasks = Endpoints::Tasks.new(client).get(project_id, id, params)
      #   end
      # end
    end
  end
end
