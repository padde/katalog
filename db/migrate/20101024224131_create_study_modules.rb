class CreateStudyModules < ActiveRecord::Migration
  def self.up
    create_table :study_modules do |t|
      t.string :name
      t.string :description
      t.string :type
      
      t.datetime :start_date
      t.datetime :end_date
      
      t.timestamps
    end
  end

  def self.down
    drop_table :study_modules
  end
end
