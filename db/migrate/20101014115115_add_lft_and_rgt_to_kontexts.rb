class AddLftAndRgtToKontexts < ActiveRecord::Migration
  def self.up
    change_table :kontexts do |t|
      t.integer :lft
      t.integer :rgt
    end
    
    Kontext.update_all 'parent_id = NULL', 'parent_id = 0'
    Kontext.rebuild!
  end

  def self.down
    change_table :kontexts do |t|
      t.remove :lft
      t.remove :rgt
    end
  end
end
