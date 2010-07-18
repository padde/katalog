class ChangeGroupsUserIdToInteger < ActiveRecord::Migration
  def self.up
    change_column :groups, :user_id, :integer
  end

  def self.down
    change_column :groups, :user_id, :string
  end
end
