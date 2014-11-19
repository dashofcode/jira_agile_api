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
    it 'can get all sprints for rapid view' do
      VCR.use_cassette('get sprints', record: :new_episodes) do
        sprints = rapid_view.sprints

        sprints.wont_be_empty

        sprint = sprints.first
        sprint.must_be_instance_of JiraAgileApi::Resources::Sprint
      end
    end
  end

  # describe '.stories' do
  #   it 'can get unscheduled stories' do
  #     VCR.use_cassette('get unscheduled stories', record: :new_episodes) do
  #       stories = project.stories(with_state: :unscheduled)
  #
  #       stories.wont_be_empty
  #
  #       story = stories.first
  #       story.must_be_instance_of TrackerApi::Resources::Story
  #       story.current_state.must_equal 'unscheduled'
  #     end
  #   end
  #
  #   it 'can create story' do
  #     VCR.use_cassette('create story') do
  #       story = project.create_story(name: 'Test story')
  #
  #       story.must_be_instance_of TrackerApi::Resources::Story
  #       story.id.wont_be_nil
  #       story.id.must_be :>, 0
  #       story.name.must_equal 'Test story'
  #     end
  #   end
  # end
end
