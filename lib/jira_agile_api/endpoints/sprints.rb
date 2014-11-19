module JiraAgileApi
  module Endpoints
    class Sprints
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(rapid_view_id, params={})
        data  = client.get("/sprintquery/#{rapid_view_id}", params: params).body
        sprints = data['sprints']
        raise JiraAgileApi::Errors::UnexpectedData, 'Array of sprints expected' unless sprints.is_a? Array

        sprints.map { |sprint| Resources::Sprint.new({ client: client }.merge(sprint)) }
      end
    end
  end
end
