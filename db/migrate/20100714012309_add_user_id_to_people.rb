class AddUserIdToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :user_id, :string
  end

  def self.down
    remove_column :people, :user_id
  end
end
