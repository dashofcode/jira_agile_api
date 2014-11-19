# JiraAgileApi

[![Gem Version](https://badge.fury.io/rb/jira_agile_api.png)](http://badge.fury.io/rb/jira_agile_api)
[![Build Status](https://travis-ci.org/dashofcode/jira_agile_api.png?branch=master)](https://travis-ci.org/dashofcode/jira_agile_api)
[![Code Climate](https://codeclimate.com/github/dashofcode/jira_agile_api.png)](https://codeclimate.com/github/dashofcode/jira_agile_api)
[![Coverage Status](https://coveralls.io/repos/dashofcode/jira_agile_api/badge.png?branch=master)](https://coveralls.io/r/dashofcode/jira_agile_api?branch=master)
[![Dependency Status](https://gemnasium.com/dashofcode/jira_agile_api.png)](https://gemnasium.com/dashofcode/jira_agile_api)

This gem allows you to easily use the [Jira Agile API](https://developer.atlassian.com/jiradev/remote-api-reference/jira-rest-apis).

It’s powered by [Faraday](https://github.com/lostisland/faraday) and [Virtus](https://github.com/solnic/virtus).

##Demonstration
[Dash of Agile](https://www.dashofagile.com) uses `jira_agile_api` to create agile dashboards from Jira Agile projects.

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'jira_agile_api', '~> 0.1.0'
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install jira_agile_api
```

## Basic Usage

```ruby
client = JiraAgileApi::Client.new(token: 'my-api-token')                        # Create API client

rapid_views = client.rapid_views                                                # Get all rapid views
rapid_view  = client.rapid_view(123456)                                         # Get rapid view with given ID

rapid_view.sprints                                                              # Get all sprints for a rapid view
```

## TODO

- Add missing resources and endpoints
- Add create, update, delete for resources

## Contributing

Currently this client supports read-only access to Jira Agile.
We will be extending it as our use cases require, but are always happy to accept contributions.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
