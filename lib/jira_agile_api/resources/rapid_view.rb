module JiraAgileApi
  module Resources
    class RapidView
      include Virtus.model

      attribute :client

      attribute :id, Integer
      attribute :name, String
      attribute :canEdit, Boolean
      attribute :sprintSupportEnabled

      # Get the backlog data for this rapid view.
      #
      # @return [Backlog]
      def backlog
        Endpoints::Backlog.new(client).get(id)
      end

      # Get all sprints associated with this rapid view.
      #
      # @param [Hash] options
      # @option params [Boolean] include_historic
      # @option params [Boolean] include_future
      # @return [Array[Sprint]]
      def sprints(options = {})
        Endpoints::Sprints.new(client).get(id, options)
      end
    end
  end
end
