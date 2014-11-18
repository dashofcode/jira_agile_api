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
    client.passwrod.must_equal 'wham!bam!'
    client.logger.must_equal LOGGER
  end

  describe '.rapid_views' do
    let(:pt_user) { PT_USER_1 }
    let(:client) { JiraAgileApi::Client.new token: pt_user[:token] }

    it 'gets all projects' do
      VCR.use_cassette('get all projects', record: :new_episodes) do
        projects = client.projects(fields: ':default,account,current_velocity,labels(name),epics(:default,label(name))')

        projects.wont_be_empty
        project = projects.first
        project.must_be_instance_of JiraAgileApi::Resources::Project
        project.id.must_equal pt_user[:project_id]

        project.account.must_be_instance_of JiraAgileApi::Resources::Account

        project.labels.wont_be_empty
        project.labels.first.must_be_instance_of JiraAgileApi::Resources::Label

        project.epics.wont_be_empty
        project.epics.first.must_be_instance_of JiraAgileApi::Resources::Epic
      end
    end
  end

  describe '.project' do
    let(:pt_user) { PT_USER_1 }
    let(:client) { JiraAgileApi::Client.new token: pt_user[:token] }
    let(:project_id) { pt_user[:project_id] }

    it 'gets a project by id' do
      VCR.use_cassette('get project', record: :new_episodes) do
        project = client.project(project_id)

        project.must_be_instance_of JiraAgileApi::Resources::Project
        project.id.must_equal project_id

        project.account.must_be_nil
        project.account_id.wont_be_nil
      end
    end
  end

end
