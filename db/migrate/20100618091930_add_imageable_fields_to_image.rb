class AddImageableFieldsToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :imageable_id, :integer
    add_column :images, :imageable_type, :string
  end

  def self.down
    add_column :images, :imageable_id
    add_column :images, :imageable_type
  end
end
