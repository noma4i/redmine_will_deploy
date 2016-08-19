require_dependency 'issue'

module IssuePatcher
  def self.included(klass)
    klass.class_eval do
      unloadable
      has_many :deploy_votes, dependent: :destroy
    end
  end
end
