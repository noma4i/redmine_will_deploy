require 'redmine'
require 'will_deploy/hooks'

require_dependency 'issue_patcher'

Issue.send(:include, IssuePatcher)

Redmine::Plugin.register :will_deploy do
  name 'Will Deploy Plugin'
  author 'Alexander Tsirel'
  description 'We need acceptance to deploy tickets'
  version '0.0.1'

  project_module :will_deploy do
    permission :will_deploy, {:will_deploy => []}
  end
end
