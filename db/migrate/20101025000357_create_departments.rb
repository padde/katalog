class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    
    add_column :people, :department_id, :integer
  end

  def self.down
    drop_table :departments
    
    remove_column :people, :department_id
  end
end
