module JiraAgileApi
  module Endpoints
    class Backlog
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(rapid_view_id)
        params = { rapidViewId: rapid_view_id }
        data   = client.get('/xboard/plan/backlog/data', params: params).body

        Resources::Backlog.new({ client: client, rapid_view_id: rapid_view_id }.merge(data))
      end
    end
  end
end
