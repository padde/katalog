class AddMetaInformationToThings < ActiveRecord::Migration
  def self.up
    change_table :things do |t|
      t.string   :kind
      t.string   :materials
      t.integer  :dimensions_x
      t.integer  :dimensions_y
      t.integer  :dimensions_z
      t.string   :dimensions_unit
      t.string   :dimensions_additional
      t.string   :tools
      t.datetime :release_date
      t.datetime :start_date
    end
  end

  def self.down
    change_table :things do |t|
      t.remove :kind
      t.remove :materials
      t.remove :dimensions_x
      t.remove :dimensions_y
      t.remove :dimensions_z
      t.remove :dimensions_unit
      t.remove :dimensions_additional
      t.remove :tools
      t.remove :release_date
      t.remove :start_date
    end
  end
end
