class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :value
      t.string :type

      t.timestamps
    end
  end
end
