require 'spec_helper'

describe Following, "valid" do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :followed_user_id }
  it { should belong_to :user }
  it { should belong_to :followed_user }
end
