class AddInstitutionToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :institution, :boolean, :default => false
  end

  def self.down
    remove_column :people, :institution
  end
end
