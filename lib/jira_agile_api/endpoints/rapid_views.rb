module JiraAgileApi
  module Endpoints
    class RapidViews
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(params={})
        data  = client.get('/rapidview', params: params).body
        views = data['views']
        raise JiraAgileApi::Errors::UnexpectedData, 'Array of rapid views expected' unless views.is_a? Array

        views.map { |rapid_view| Resources::RapidView.new({ client: client }.merge(rapid_view)) }
      end
    end
  end
end
