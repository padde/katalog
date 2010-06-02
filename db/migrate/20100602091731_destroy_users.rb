class DestroyUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
  end
  
  def self.down
    create_table :users do |t|
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
