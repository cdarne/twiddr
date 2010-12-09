class User < ActiveRecord::Base
  include Clearance::User
  validates_presence_of :twiddr_name
  has_many :followings

  def follow(another_user)
    self.followings.create(:followed_user_id => another_user.id)
  end

  def follows?(another_user)
    self.followings.exists?(["followed_user_id = ?", another_user])
  end
end
