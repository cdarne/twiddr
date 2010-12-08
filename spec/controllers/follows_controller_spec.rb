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
