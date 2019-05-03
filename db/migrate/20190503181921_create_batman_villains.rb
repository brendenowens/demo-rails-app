class CreateBatmanVillains < ActiveRecord::Migration[5.2]
  def change
    create_table :batman_villains do |t|
      t.timestamps
    end
  end
end
