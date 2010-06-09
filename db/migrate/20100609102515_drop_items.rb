class DropItems < ActiveRecord::Migration
  def self.up
    drop_table :items
  end

  def self.down
    create_table :items do |t|
      t.string   :title
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
