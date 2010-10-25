class RenameTypeToKindInStudyModules < ActiveRecord::Migration
  def self.up
    rename_column :study_modules, :type, :kind
  end

  def self.down
    rename_column :study_modules, :kind, :type
  end
end
