module JiraAgileApi
  module Resources
    class RapidView
      include Virtus.model

      attribute :client

      attribute :id, Integer
      attribute :name, String
      attribute :canEdit, Boolean
      attribute :sprintSupportEnabled, Boolean

      # Get all sprints associated with this rapid view.
      #
      # @return [Array[Sprint]]
      def sprints(params = {})
        Endpoints::Sprints.new(client).get(id, params)
      end
    end
  end
end
