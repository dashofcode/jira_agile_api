module JiraAgileApi
  module Endpoints
    class SprintReport
      attr_accessor :client, :sprint

      def initialize(client, sprint)
        @client = client
        @sprint = sprint
      end

      def get
        params               = { rapidViewId: sprint.rapid_view_id, sprintId: sprint.id }
        data                 = client.get('/rapid/charts/sprintreport', params: params).body
        report_data          = data['contents']
        sprint_data          = data['sprint']

        # manually update the sprint with the new info the sprint report provides
        @sprint.closed       = sprint_data['closed'] if sprint_data.has_key?('closed')
        @sprint.startDate    = sprint_data['startDate'] if sprint_data.has_key?('startDate')
        @sprint.endDate      = sprint_data['endDate'] if sprint_data.has_key?('endDate')
        @sprint.completeDate = sprint_data['completeDate'] if sprint_data.has_key?('completeDate')

        JiraAgileApi::Resources::SprintReport.new(report_data)
      end
    end
  end
end
