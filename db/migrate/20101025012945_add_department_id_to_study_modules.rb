class AddDepartmentIdToStudyModules < ActiveRecord::Migration
  def self.up
    add_column :study_modules, :department_id, :integer
  end

  def self.down
    remove_column :people, :department_id
  end
end
