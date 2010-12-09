class Following < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :followed_user_id
  belongs_to :user
  belongs_to :followed_user, :class_name => "User"
end
