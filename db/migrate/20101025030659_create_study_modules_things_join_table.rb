class CreateStudyModulesThingsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :study_modules_things, :id => false do |t|
      t.integer :thing_id
      t.integer :study_module_id
    end
  end

  def self.down
    drop_table :study_modules_things
  end
end
