# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# first_user = User.create(name: 'Farida', role: 'admin')
# second_user = User.create(name: 'Guest', role: 'guest')
# third_user = User.create(name: 'Aakash', role: 'user')
puts 'Seeding to database initiated ...'

first_user = User.create(name: 'Farida', email: 'farida@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', role: 'admin')
second_user = User.create(name: 'Guest', email: 'guest@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', role: 'guest')
third_user = User.create(name: 'Aakash', email: 'skybrel@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', role: 'user')


recipe_1 = Recipe.create(name: 'Sweet Potato Dum 1', preparation_time: 25.5, cooking_time: 20.05, description: 'It is very easy, delicious and powerful dish famous in Asia.', public: true, user_id: first_user.id)
recipe_2 = Recipe.create(name: 'Sweet Potato Dum 2', preparation_time: 25.5, cooking_time: 20.05, description: 'It is very easy, delicious and powerful dish famous in Asia.', public: false, user_id: first_user.id)
recipe_3 = Recipe.create(name: 'Potato Dum', preparation_time: 2.5, cooking_time: 2.05, description: 'It is very easy, delicious and powerful dish famous in Asia.', public: false, user_id: second_user.id)
recipe_4 = Recipe.create(name: 'Dum', preparation_time: 2.5, cooking_time: 2.05, description: 'It is very easy, delicious and powerful dish famous in Asia.', public: false, user_id: second_user.id)

food_1 = Food.create(name: 'apple', measurement_unit: 'kilograms', price: 2.15, user_id: first_user.id, quantity: 15)
food_2 = Food.create(name: 'almonds', measurement_unit: 'grams', price: 10.25, user_id: third_user.id, quantity: 12)
food_3 = Food.create(name: 'gold powder', measurement_unit: 'milligrams', price: 15.35, user_id: first_user.id, quantity: 7)

recipe_food_1 = RecipeFood.create(quantity: 5, recipe_id: recipe_1.id, food_id: food_1.id)
recipe_food_2 = RecipeFood.create(quantity: 15, recipe_id: recipe_1.id, food_id: food_3.id)
recipe_food_3 = RecipeFood.create(quantity: 8, recipe_id: recipe_1.id, food_id: food_2.id)

recipe_food_4 = RecipeFood.create(quantity: 7, recipe_id: recipe_2.id, food_id: food_1.id)
recipe_food_5 = RecipeFood.create(quantity: 11, recipe_id: recipe_3.id, food_id: food_2.id)
recipe_food_6 = RecipeFood.create(quantity: 2, recipe_id: recipe_4.id, food_id: food_3.id)

puts 'Data successfully seeded to database'