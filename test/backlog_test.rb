require_relative 'minitest_helper'

describe JiraAgileApi::Resources::Backlog do
  let(:client) { JiraAgileApi::Client.new url: JIRA_URL, username: JIRA_USERNAME, password: JIRA_PASSWORD }
  let(:rapid_view_id) { 1 }
  let(:backlog) { VCR.use_cassette('get backlog') { client.rapid_view(rapid_view_id).backlog } }

  it 'can get all the issues in the rapid view' do
    issues = backlog.issues

    issues.wont_be_nil
    issues.must_be_instance_of Array

    issues.first.must_be_instance_of JiraAgileApi::Resources::Issue
  end

  it 'injects client into all issues' do
    issue = backlog.issues.first

    issue.client.must_be_instance_of JiraAgileApi::Client
  end

  it 'can get all the issues in the backlog (not associated with a sprint)' do
    issues = backlog.backlogIssues

    issues.wont_be_nil
    issues.must_be_instance_of Array

    issues.first.must_be_instance_of JiraAgileApi::Resources::Issue
  end

  it 'can get all the sprints in the rapid view' do
    sprints = backlog.sprints

    sprints.wont_be_nil
    sprints.must_be_instance_of Array

    sprints.first.must_be_instance_of JiraAgileApi::Resources::Sprint
  end

  it 'injects client and rapid view id into all sprints' do
    sprint = backlog.sprints.first

    sprint.client.must_be_instance_of JiraAgileApi::Client
    sprint.rapid_view_id.must_equal rapid_view_id
  end

  it 'can get issues associated with a specific sprint' do
    sprint = backlog.sprints.first
    issues = sprint.issues

    issues.wont_be_nil
    issues.must_be_instance_of Array

    issues.first.must_be_instance_of JiraAgileApi::Resources::Issue
  end

  it 'can get all the epics in the rapid view' do
    epics = backlog.epics

    epics.wont_be_nil
    epics.must_be_instance_of Array

    epics.first.must_be_instance_of JiraAgileApi::Resources::Epic
    epics.first.epicStats.must_be_instance_of JiraAgileApi::Resources::Epic::Stats
  end

  it 'can get all issues for an epic' do
    epic   = backlog.epics.first
    issues = epic.issues

    issues.wont_be_nil
    issues.must_be_instance_of Array

    issue = issues.first
    issue.must_be_instance_of JiraAgileApi::Resources::Issue
    issue.epic_key.must_equal epic.key
    issue.epic.key.must_equal epic.key
  end
end
