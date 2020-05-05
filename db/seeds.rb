User.destroy_all
Property.destroy_all
Booking.destroy_all

user1 = User.create(name: "Chuk")

property1 = Property.create(title: "Victorian Townhouse", no_of_rooms: 6, self_catered: "yes", wi_fi: "yes", price_per_night: 280)
property2 = Property.create(title: "Victorian Basement Studio", no_of_rooms: 1, self_catered: "yes", wi_fi: "no", price_per_night: 100)
property3 = Property.create(title: "Victorian 1st Floor Flat", no_of_rooms: 2, self_catered: "yes", wi_fi: "yes", price_per_night: 130)
property4 = Property.create(title: "Luxurious London Penthouse", no_of_rooms: 3, self_catered: "yes", wi_fi: "yes", price_per_night: 350)
property5 = Property.create(title: "No. 10 Downing Street", no_of_rooms: 2, self_catered: "no", wi_fi: "no", price_per_night: 1000)
property6 = Property.create(title: "Top of the Shard Flat", no_of_rooms: 4, self_catered: "yes", wi_fi: "yes", price_per_night: 180)
property7 = Property.create(title: "Edwarding Semi-detached House", no_of_rooms: 5, self_catered: "yes", wi_fi: "yes", price_per_night: 220)
property8 = Property.create(title: "Pool House", no_of_rooms: 1, self_catered: "yes", wi_fi: "no", price_per_night: 90)
property9 = Property.create(title: "Brick Lane Shoreditch Sanctuary", no_of_rooms: 3, self_catered: "no", wi_fi: "yes", price_per_night: 180)
property10 = Property.create(title: "Trendy London Flat", no_of_rooms: 2, self_catered: "yes", wi_fi: "yes", price_per_night: 180)
# property11 = Property.create(title: "Stylish and Modern Family Home", no_of_rooms: 6, self_catered: "yes", wi_fi: "yes", price_per_night: 180)
# property12 = Property.create(title: "City Getaway Townhouse", no_of_rooms: 5, self_catered: "yes", wi_fi: "yes", price_per_night: 180)
# property13 = Property.create(title: "Beautiful House with Conservatory", no_of_rooms: 4, self_catered: "yes", wi_fi: "yes", price_per_night: 180)
# property14 = Property.create(title: "City Centre Condo", no_of_rooms: 6, self_catered: "yes", wi_fi: "yes", price_per_night: 180)
# property15 = Property.create(title: "Mansion Flat", no_of_rooms: 3, self_catered: "yes", wi_fi: "no", price_per_night: 180)
# property16 = Property.create(title: "Stylish Duplex", no_of_rooms: 6, self_catered: "yes", wi_fi: "yes", price_per_night: 180)
# property17 = Property.create(title: "Cheap crash-pad in London", no_of_rooms: 6, self_catered: "yes", wi_fi: "no", price_per_night: 50)
# property18 = Property.create(title: "Bright and Spacious Condo", no_of_rooms: 2, self_catered: "yes", wi_fi: "yes", price_per_night: 125)
# property19 = Property.create(title: "Amazing Double Bedroom in the suburbs", no_of_rooms: 1, self_catered: "yes", wi_fi: "yes", price_per_night: 75)
# property20 = Property.create(title: "Trendy Surburbian Bungalow", no_of_rooms: 3, self_catered: "no", wi_fi: "no", price_per_night: 135)
# property21 = Property.create(title: "WeWork Office Building", no_of_rooms: 100, self_catered: "no", wi_fi: "yes", price_per_night: 95)
# property22 = Property.create(title: "Traditional BnB", no_of_rooms: 8, self_catered: "yes", wi_fi: "yes", price_per_night: 80)
# property23 = Property.create(title: "Rooms with a view", no_of_rooms: 5, self_catered: "yes", wi_fi: "yes", price_per_night: 118)
# property24 = Property.create(title: "Cosy 1 Bed Flat", no_of_rooms: 1, self_catered: "yes", wi_fi: "no", price_per_night: 65)
# property25 = Property.create(title: "Luxury 3 Bed Flat", no_of_rooms: 6, self_catered: "yes", wi_fi: "yes", price_per_night: 250)


booking1 = Booking.create(user_id: user1.id, property_id: property1.id, price: 180, payment_status: "Paid")