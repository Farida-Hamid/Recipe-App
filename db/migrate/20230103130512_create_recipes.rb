class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :preparation_time
      t.float :cooking_time
      t.text :description
      t.boolean :public
      t.integer :recipe_food_counter, default: 0
      t.references :owner, references: :users, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
