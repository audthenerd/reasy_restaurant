# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Category.create([{name: 'Japanese', image_url: 'jap_food.jpg'}, {name: 'Korean', image_url: 'korean_food.jpg'}, {name: 'Chinese', image_url: 'chinese_food.jpg'}, {name: 'Italian', image_url: 'italian_food.jpg'}, {name: 'French', image_url: 'french_food.jpg'}])

Userrest.create(email: "wh_wang@live.com", encrypted_password: "$2a$11$urCx145J.dXM4JVtKOKiI.6Pjku1fsGjgXQbKa4zb2.1FQpLS9ZvK").first_or_create(email: "wh_wang@live.com")

# Restaurant.create(name: "firstrestro", ... )