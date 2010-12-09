require 'spec_helper'

describe User, 'valid' do
  it { should validate_presence_of :twiddr_name }
  it { should have_many :followings }
end

describe User, '#follows?' do
  subject { Factory(:email_confirmed_user) }
  let(:followed_user) { Factory(:email_confirmed_user) }
  let(:another_user) { Factory(:email_confirmed_user) }

  before do
    subject.follow(followed_user)
  end

  it "returns true when it follows the user" do
    subject.follows?(followed_user).should be_true
  end

  it "returns false when it does not follow the user" do
    subject.follows?(another_user).should be_false
  end
end

describe User, "following another user" do
  subject { Factory(:email_confirmed_user) }
  let(:user_to_follow) { Factory(:email_confirmed_user) }

  before do
    subject.follow(user_to_follow)
  end

  it "makes the user follow the provided user" do
    subject.follows?(user_to_follow).should be_true
  end

  it "does not make the provided user follow the user" do
    user_to_follow.follows?(subject).should be_false
  end
end
