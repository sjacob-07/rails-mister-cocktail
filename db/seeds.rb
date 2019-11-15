require "json"
require "open-uri"

require "faker"


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts 'Cleaning database...'
# Ingredient.destroy_all

# puts 'Creating ingredients...'

# # url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# # repos = open(url)
# # ingredients = JSON.parse(repos)
# # ingredient = ingredients[0]

# # ingredient.each do
# #   Ingredient.create(name: ingredient['strIngredient1'])
# # end
# Cocktail.create(name: )

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# puts 'Finished!'



puts 'Cleaning database...'
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

puts 'Creating cocktails...'


@ing_array = []
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ings_json = JSON.parse(open(url).string)
ingredient_json = ings_json['drinks']

ingredient_json.each do |ing|
  ret_ing =  ing['strIngredient1']
  spec_ing = Ingredient.create(name: ret_ing)
  @ing_array << ret_ing
end



5.times do
  cocktail = Cocktail.create!(
        name: Faker::Food.fruits
    )

  final = @ing_array.sample(1).to_s

  ingredient = Ingredient.create!({
        name: final
      })

    Dose.create!({
    description: Faker::Food.measurement,
    cocktail: cocktail,
    ingredient: ingredient
    })

end





# Restaurant.create!(restaurants_attributes)
puts 'Finished!'
