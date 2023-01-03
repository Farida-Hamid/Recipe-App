class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :price
      t.integer :quantity, limit: 2
      t.integer :recipe_food_counter, default: 0
      t.references :owner, references: :users, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
