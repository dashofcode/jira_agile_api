module JiraAgileApi
  module Resources
    class SprintReport
      include Virtus.model

      attribute :completedIssues, Array[JiraAgileApi::Resources::Issue]
      attribute :incompletedIssues, Array[JiraAgileApi::Resources::Issue]
      attribute :puntedIssues, Array[JiraAgileApi::Resources::Issue]
      attribute :completedIssuesEstimateSum, JiraAgileApi::Resources::EstimateSum
      attribute :incompletedIssuesEstimateSum, JiraAgileApi::Resources::EstimateSum
      attribute :allIssuesEstimateSum, JiraAgileApi::Resources::EstimateSum
      attribute :puntedIssuesEstimateSum, JiraAgileApi::Resources::EstimateSum
      attribute :issueKeysAddedDuringSprint, Hash[String => Boolean]
    end
  end
end
