class CreateCredits < ActiveRecord::Migration
  def self.up
    create_table :credits do |t|
      t.integer :person_id
      t.integer :thing_id
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :credits
  end
end
