require_relative 'minitest_helper'

describe JiraAgileApi::Resources::RapidView do
  let(:client) { JiraAgileApi::Client.new url: JIRA_URL, username: JIRA_USERNAME, password: JIRA_PASSWORD }
  let(:rapid_view_id) { 1 }
  let(:rapid_view) { VCR.use_cassette('get rapid view') { client.rapid_view(rapid_view_id) } }

  describe 'epics' do
    it 'gets all epics for this project' do
      VCR.use_cassette('get epics', record: :new_episodes) do
        # epics = project.epics
        #
        # epics.wont_be_empty
        # epic = epics.first
        # epic.must_be_instance_of TrackerApi::Resources::Epic
      end
    end
  end

  describe 'sprints' do
    it 'can get active sprints for rapid view' do
      VCR.use_cassette('get active sprints', record: :new_episodes) do
        sprints = rapid_view.sprints

        sprints.wont_be_empty

        sprint = sprints.last
        sprint.must_be_instance_of JiraAgileApi::Resources::Sprint
        sprint.state.must_equal 'ACTIVE'
      end
    end

    it 'can get all sprints for rapid view' do
      VCR.use_cassette('get all sprints', record: :new_episodes) do
        sprints = rapid_view.sprints(include_historic: true, include_future: true)

        sprints.wont_be_empty

        sprint = sprints.last
        sprint.must_be_instance_of JiraAgileApi::Resources::Sprint
        sprint.state.must_equal 'FUTURE'
      end
    end

    it 'can get the backlog with all sprints and issues' do
      VCR.use_cassette('get backlog', record: :new_episodes) do
        backlog = rapid_view.backlog

        backlog.wont_be_empty
        backlog.must_be_instance_of JiraAgileApi::Resources::Backlog
      end
    end
  end
end
