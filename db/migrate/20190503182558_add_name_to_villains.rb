class AddNameToVillains < ActiveRecord::Migration[5.2]
  def change
    add_column :batman_villains, :name, :string
  end
end
