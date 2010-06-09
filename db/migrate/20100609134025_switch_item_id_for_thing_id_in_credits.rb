class SwitchItemIdForThingIdInCredits < ActiveRecord::Migration
  def self.up
    remove_column :credits, :item_id
    add_column :credits, :thing_id, :integer
  end

  def self.down
    remove_column :credits, :thing_id
    add_column :credits, :item_id, :integer
  end
end
