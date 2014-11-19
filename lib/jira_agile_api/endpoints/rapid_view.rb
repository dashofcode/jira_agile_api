module JiraAgileApi
  module Endpoints
    class RapidView
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(id, params={})
        data = client.get("/rapidview/#{id}", params: params).body

        Resources::RapidView.new({ client: client }.merge(data))
      end
    end
  end
end
