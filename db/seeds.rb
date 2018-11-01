# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Category.create([{name: 'Japanese', image_url: 'jap_food.jpg'}, {name: 'Korean', image_url: 'korean_food.jpg'}, {name: 'Chinese', image_url: 'chinese_food.jpg'}, {name: 'Italian', image_url: 'italian_food.jpg'}, {name: 'French', image_url: 'french_food.jpg'}])


Userrest.create(email: "wenhao@live.com", password: "password")
Userrest.create(email: "audrey@gmail.com", password: "password")
Userrest.create(email: "clara@live.com", password: "password")

Restaurant.create(name: "firstrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 1, image_url: ["ckfnaqz5yltmqrmeofr8", "wgkgrfbz0fewutrejsli"])
Restaurant.create(name: "secrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 2, image_url: ["ckfnaqz5yltmqrmeofr8", "wgkgrfbz0fewutrejsli"])
Restaurant.create(name: "thirdrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 3, image_url: ["ckfnaqz5yltmqrmeofr8", "wgkgrfbz0fewutrejsli"])
Restaurant.create(name: "fourthrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 1, image_url: ["ckfnaqz5yltmqrmeofr8", "wgkgrfbz0fewutrejsli"])
Restaurant.create(name: "fifthrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 2, image_url: ["ckfnaqz5yltmqrmeofr8", "wgkgrfbz0fewutrejsli"])
Restaurant.create(name: "sixthrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 3, image_url: ["ckfnaqz5yltmqrmeofr8", "wgkgrfbz0fewutrejsli"])

Customer.create(name:"wenhao", email:"what@gmail.com", password: "password", image_url: "fa3ingoojck75cf5akgw")
Customer.create(name:"audrey", email:"the@gmail.com", password: "password", image_url: "fa3ingoojck75cf5akgw")
Customer.create(name:"clara", email:"hell@gmail.com", password: "password", image_url: "fa3ingoojck75cf5akgw")

Menuitem.create(item: "oneitem", price: 10.00, restaurant_id: 1)
Menuitem.create(item: "twoitem", price: 10.00, restaurant_id: 1)
Menuitem.create(item: "threeitem", price: 10.00, restaurant_id: 1)
Menuitem.create(item: "fouritem", price: 10.00, restaurant_id: 1)
Menuitem.create(item: "oneitem", price: 10.00, restaurant_id: 2)
Menuitem.create(item: "twoitem", price: 10.00, restaurant_id: 2)
Menuitem.create(item: "threeitem", price: 10.00, restaurant_id: 2)
Menuitem.create(item: "fouritem", price: 10.00, restaurant_id: 2)
Menuitem.create(item: "oneitem", price: 10.00, restaurant_id: 3)
Menuitem.create(item: "twoitem", price: 10.00, restaurant_id: 3)
Menuitem.create(item: "threeitem", price: 10.00, restaurant_id: 3)
Menuitem.create(item: "fouritem", price: 10.00, restaurant_id: 3)