class AddStudyModuleIdToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :study_module_id, :integer
  end

  def self.down
    remove_column :people, :study_module_id
  end
end
