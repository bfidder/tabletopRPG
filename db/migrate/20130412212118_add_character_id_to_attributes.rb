class AddCharacterIdToAttributes < ActiveRecord::Migration
  def change
		add_column :attributes, :character_id, :integer
		add_column :skills, :character_id, :integer
		add_column :equipment, :character_id, :integer
  end
end
