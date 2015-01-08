module JiraAgileApi
  module Resources
    class Sprint
      include Virtus.model

      class TimeRemaining
        include Virtus.value_object

        values do
          attribute :text, String
          attribute :isFuture, Boolean
        end
      end

      attribute :client
      attribute :rapid_view_id, Integer

      attribute :id, Integer
      attribute :name, String
      attribute :state, String
      attribute :closed, Boolean
      attribute :startDate, DateTime
      attribute :endDate, DateTime
      attribute :completeDate, DateTime
      attribute :timeRemaining, JiraAgileApi::Resources::Sprint::TimeRemaining
      attribute :issuesIds, Array[Integer]
      attribute :issues, Array[JiraAgileApi::Resources::Issue], default: []

      # Get sprint details.
      #
      # @return [SprintReport]
      def sprint_report
        Endpoints::SprintReport.new(client, self).get
      end
    end
  end
end
