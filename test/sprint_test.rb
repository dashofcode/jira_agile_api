require_relative 'minitest_helper'

describe JiraAgileApi::Resources::Sprint do
  let(:client) { JiraAgileApi::Client.new url: JIRA_URL, username: JIRA_USERNAME, password: JIRA_PASSWORD }
  let(:rapid_view_id) { 1 }
  let(:rapid_view) { VCR.use_cassette('get rapid view') { client.rapid_view(rapid_view_id) } }
  let(:sprint) { VCR.use_cassette('get active sprint') { rapid_view.sprints.last } }

  describe 'sprint_report' do
    it 'can get a sprint report for a sprint' do
      VCR.use_cassette('get sprint report', record: :new_episodes) do
        sprint_report = sprint.sprint_report

        sprint_report.must_be_instance_of JiraAgileApi::Resources::SprintReport
      end
    end

    it 'gets updated data from the sprint report' do
      VCR.use_cassette('get sprint report', record: :new_episodes) do
        sprint.startDate.must_be_nil
        sprint.endDate.must_be_nil

        sprint_report = sprint.sprint_report

        sprint.startDate.must_be_instance_of DateTime
        sprint.endDate.must_be_instance_of DateTime
      end
    end
  end
end
