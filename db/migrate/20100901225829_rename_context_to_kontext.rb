class RenameContextToKontext < ActiveRecord::Migration
  def self.up
    rename_table :contexts, :kontexts
  end

  def self.down
    rename_table :kontexts, :contexts
  end
end
