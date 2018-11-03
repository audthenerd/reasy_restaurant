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

Restaurant.create(name: "firstrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 1, image_url: ["r8se1apiuq2infg3ilnk", "stomyt0cxeuisfpqmpyy","wokteh06yeng3e49jzf0"], starttime: "09:00:00", endtime: "20:00:00", breakstart: "11:00:00", breakend: "15:00:00", avail_seats: 20)
Restaurant.create(name: "secrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 2, image_url: ["photo-1481931098730-318b6f776db0", "photo-1536408437497-34525e7ee715","photo-1498588747262-0f2241707d13"], starttime: "09:00:00", endtime: "20:00:00", breakstart: "11:00:00", breakend: "15:00:00", avail_seats: 20)
Restaurant.create(name: "thirdrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 3, image_url: ["r8se1apiuq2infg3ilnk", "stomyt0cxeuisfpqmpyy","wokteh06yeng3e49jzf0"], starttime: "09:00:00", endtime: "20:00:00", breakstart: "11:00:00", breakend: "15:00:00", avail_seats: 20)
Restaurant.create(name: "fourthrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 1, image_url: ["photo-1481931098730-318b6f776db0", "photo-1536408437497-34525e7ee715","photo-1498588747262-0f2241707d13"], starttime: "09:00:00", endtime: "20:00:00", breakstart: "11:00:00", breakend: "15:00:00", avail_seats: 20)
Restaurant.create(name: "fifthrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 2, image_url: ["r8se1apiuq2infg3ilnk", "stomyt0cxeuisfpqmpyy","wokteh06yeng3e49jzf0"], starttime: "09:00:00", endtime: "20:00:00", breakstart: "11:00:00", breakend: "15:00:00", avail_seats: 20)
Restaurant.create(name: "sixthrestro", street: "1 hougang street 91", city: "singapore", zip: "538692", userrest_id: 3, image_url: ["photo-1481931098730-318b6f776db0", "photo-1536408437497-34525e7ee715","photo-1498588747262-0f2241707d13"], starttime: "09:00:00", endtime: "20:00:00", breakstart: "11:00:00", breakend: "15:00:00", avail_seats: 20)

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

CategoriesRestaurant.create(category_id: 1, restaurant_id: 1)
CategoriesRestaurant.create(category_id: 2, restaurant_id: 1)
CategoriesRestaurant.create(category_id: 3, restaurant_id: 2)
CategoriesRestaurant.create(category_id: 3, restaurant_id: 3)
CategoriesRestaurant.create(category_id: 4, restaurant_id: 3)
CategoriesRestaurant.create(category_id: 5, restaurant_id: 4)
CategoriesRestaurant.create(category_id: 5, restaurant_id: 5)
CategoriesRestaurant.create(category_id: 4, restaurant_id: 6)
CategoriesRestaurant.create(category_id: 4, restaurant_id: 7)
CategoriesRestaurant.create(category_id: 1, restaurant_id: 7)
CategoriesRestaurant.create(category_id: 2, restaurant_id: 8)
CategoriesRestaurant.create(category_id: 2, restaurant_id: 10)
CategoriesRestaurant.create(category_id: 3, restaurant_id: 10)
CategoriesRestaurant.create(category_id: 3, restaurant_id: 9)
CategoriesRestaurant.create(category_id: 5, restaurant_id: 14)

Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-22', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-22', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-23', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-24', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-22', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-13', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-20', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-21', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-26', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-22', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-28', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-24', reservation_time: '11:15:00')
Reservation.create(restaurant_id: 1, customer_id: 3, reservation_date: '2018-11-29', reservation_time: '11:15:00')

