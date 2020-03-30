class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)
    if !current_account
      flash[:notice] = "Sign up to register to this subreddit."
      redirect_to new_account_registration_path
    else
      @subscription.account_id = current_account.id
      @subscription.save
      redirect_to community_path(@subscription.community_id)
    end
  end

  def subscription_params
    params.require(:subscription).permit(:community_id)
  end

end
