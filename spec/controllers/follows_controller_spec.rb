require "spec_helper"

describe FollowsController, "routes" do
  it { should route(:post, "/users/1/follows").to(:action => "create", :user_id => 1) }
end

describe FollowsController, "POST to create without authenticating" do
  before do
    post :create, :user_id => 1
  end
  it { should redirect_to(sign_in_path) }
end

describe FollowsController, "authenticated POST to create" do
  let(:follower) { Factory(:email_confirmed_user) }
  let(:user_to_follow) { Factory(:email_confirmed_user) }

  before do
    controller.current_user = follower #sign in
    post :create, :user_id => user_to_follow.id
  end

  it { should redirect_to root_path }
  it "makes the signed in user follow the provided user" do
    controller.current_user.follows?(user_to_follow).should be_true
  end
end
