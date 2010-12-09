class CreateFollowings < ActiveRecord::Migration
  def self.up
    create_table :followings do |t|
      t.references :user
      t.integer :followed_user_id

      t.timestamps
    end
    add_index :followings, :user_id
  end

  def self.down
    drop_table :followings
  end
end
