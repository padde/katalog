class CreatePeopleStudyModulesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :people_study_modules, :id => false do |t|
      t.integer :person_id
      t.integer :study_module_id
    end
  end

  def self.down
    drop_table :people_study_modules
  end
end
