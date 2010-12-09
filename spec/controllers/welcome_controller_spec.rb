require 'spec_helper'

describe WelcomeController, 'routes' do
  it { should route(:get, '/').to(:action => "index") }
end

describe WelcomeController, "GET to index without authenticating" do
  before do
    get :index
  end
  it { should redirect_to(sign_in_path) }
end

describe WelcomeController, "GET to index when logged in" do
  let(:user) { Factory(:email_confirmed_user) }
  before do
    controller.current_user = user
    get :index
  end
  it { should render_template :index }
end
