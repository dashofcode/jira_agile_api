module JiraAgileApi
  module Endpoints
    class Sprints
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(rapid_view_id, options={})
        params  = { includeHistoricSprints: options.fetch(:include_historic, false),
                    includeFutureSprints:   options.fetch(:include_future, false) }
        data    = client.get("/sprintquery/#{rapid_view_id}", params: params).body
        sprints = data['sprints']
        raise JiraAgileApi::Errors::UnexpectedData, 'Array of sprints expected' unless sprints.is_a? Array

        sprints.map do |sprint|
          Resources::Sprint.new({ client: client, rapid_view_id: rapid_view_id }.merge(sprint))
        end
      end
    end
  end
end
