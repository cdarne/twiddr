require 'spec_helper'

describe UsersController, 'routes' do
  it { should route(:get, 'users/1').to(:action => "show", :id => 1) }
end
