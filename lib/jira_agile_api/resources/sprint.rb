module JiraAgileApi
  module Resources
    class Sprint
      include Virtus.model

      attribute :client

      attribute :id, Integer
      attribute :name, String
      attribute :state, String
      attribute :closed, Boolean
      attribute :startDate, DateTime
      attribute :endDate, DateTime
      attribute :completeDate, DateTime
      attribute :issuesIds, Array[Fixnum]
      attribute :issues, Array[JiraAgileApi::Resources::Issue]
    end
  end
end
