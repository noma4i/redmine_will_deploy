class WillDeployController < ApplicationController
  unloadable
  before_filter :find_issue

  def perform_acceptance
    vote = @issue.deploy_votes.where(user_id: User.current).try(:last)
    answer = params[:vote].present?
    if vote.present?
      vote.agreed = answer
    else
      vote = @issue.deploy_votes.new(
        user: User.current,
        agreed: answer
      )
    end
    if vote.save!
      mark_issue
      flash[:notice] = answer ? 'You have voted to deploy!' : 'You have voted to NOT deploy!'
      redirect_to :back
    else
      flash[:error] = 'Error!'
      redirect_to :back
    end
  end

  def revoke_acceptance
    vote = @issue.deploy_votes.where(user_id: User.current.id)
    if vote.destroy_all
      mark_issue
      flash[:notice] = 'Your vote was revoked!'
      redirect_to :back
    else
      flash[:error] = 'Error!'
      redirect_to :back
    end
  end

  protected

  def mark_issue
    quorum = @issue.deploy_votes.where(agreed: true).count >= 2
    c_id = CustomField.find_by_name("Deploy?")
    c_value = @issue.custom_values.where(custom_field_id: c_id).first_or_initialize
    c_value.value = quorum ? 'Yes' : 'No'
    c_value.save!
  end

  def find_issue
    @issue = Issue.find(params[:id]) if params[:id].present?
  end
end
