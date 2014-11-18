module TrackerApi
  module Endpoints
    class RapidViews
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(params={})
        data = client.get('/rapidview', params: params)
        raise TrackerApi::Errors::UnexpectedData, 'Array of rapid views expected' unless data.is_a? Array

        data.map { |rapid_view| Resources::RapidView.new({ client: client }.merge(rapid_view)) }
      end
    end
  end
end
