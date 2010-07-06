class AddLicenseToThings < ActiveRecord::Migration
  def self.up
    add_column :things, :license, :string
  end

  def self.down
    remove_column :things, :license
  end
end
