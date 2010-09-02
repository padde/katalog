class CreateKontextLinks < ActiveRecord::Migration
  def self.up
    create_table :kontext_links do |t|
      t.integer :kontext_id
      t.integer :kontextable_id
      t.string :kontextable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :kontext_links
  end
end
