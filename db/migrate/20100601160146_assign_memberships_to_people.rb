class AssignMembershipsToPeople < ActiveRecord::Migration
  def self.up
    change_table :memberships do |t|
      t.remove :user_id
      t.integer :person_id
    end
  end

  def self.down
    change_table :memberships do |t|
      t.integer :user_id
      t.remove :person_id
    end
  end
end
