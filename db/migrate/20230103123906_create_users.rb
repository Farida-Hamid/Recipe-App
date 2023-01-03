class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.string :role
      t.integer :food_counter, default: 0
      t.integer :recipe_counter, default: 0

      t.timestamps
    end
  end
end
