class AddTwiddrNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :twiddr_name, :string
  end

  def self.down
    remove_column :users, :twiddr_name
  end
end
