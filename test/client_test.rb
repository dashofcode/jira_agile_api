require_relative 'minitest_helper'

describe JiraAgileApi do
  it 'has a version' do
    ::JiraAgileApi::VERSION.wont_be_nil
  end
end

describe JiraAgileApi::Client do
  it 'can be configured' do
    client = JiraAgileApi::Client.new(url:         'http://test.com',
                                      api_version: '/foo-bar/1',
                                      username:    'larry',
                                      password:    'wham!bam!',
                                      logger:      LOGGER)

    client.url.must_equal 'http://test.com'
    client.api_version.must_equal '/foo-bar/1'
    client.username.must_equal 'larry'
    client.password.must_equal 'wham!bam!'
    client.logger.must_equal LOGGER
  end

  describe 'rapid_views' do
    let(:client) { JiraAgileApi::Client.new url: JIRA_URL, username: JIRA_USERNAME, password: JIRA_PASSWORD }

    it 'gets all rapid views' do
      VCR.use_cassette('get all rapid views', record: :new_episodes) do
        rapid_views = client.rapid_views

        rapid_views.wont_be_empty
        rapid_view = rapid_views.first
        rapid_view.must_be_instance_of JiraAgileApi::Resources::RapidView
        rapid_view.id.must_equal 1
      end
    end
  end

  # describe '.project' do
  #   let(:pt_user) { PT_USER_1 }
  #   let(:client) { JiraAgileApi::Client.new token: pt_user[:token] }
  #   let(:project_id) { pt_user[:project_id] }
  #
  #   it 'gets a project by id' do
  #     VCR.use_cassette('get project', record: :new_episodes) do
  #       project = client.project(project_id)
  #
  #       project.must_be_instance_of JiraAgileApi::Resources::Project
  #       project.id.must_equal project_id
  #
  #       project.account.must_be_nil
  #       project.account_id.wont_be_nil
  #     end
  #   end
  # end

end
