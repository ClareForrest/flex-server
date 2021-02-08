user1 = User.create(first_name: "Olivia", last_name: "Judge", email: "olivia@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123651")
employee1 = Employee.create(user_id: user1.id, availability: "monday, tuesday, wednesday, thursday")


user2 = User.create(first_name: "Liam", last_name: "Tens", email: "liam@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123652")
employee2 = Employee.create(user_id: user2.id, availability: "monday, tuesday, wednesday, thursday")
user3 = User.create(first_name: "Emma", last_name: "Waldorf", email: "emma@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123653")
employee3 = Employee.create(user_id: user3.id, availability: "monday, tuesday, wednesday, thursday")
user4 = User.create(first_name: "Ava", last_name: "McKenzie", email: "ava@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123654")
employee4 = Employee.create(user_id: user4.id, availability: "monday, tuesday, wednesday, thursday")
user5 = User.create(first_name: "Noah", last_name: "Rains", email: "noah@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123655")
user6 = User.create(first_name: "Sophia", last_name: "Jenkins", email: "sophia@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123656")
user7 = User.create(first_name: "Isabella", last_name: "Reynolds", email: "isabella@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "1236547")
user8 = User.create(first_name: "Oliver", last_name: "Turbold", email: "oliver@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123658")
user9 = User.create(first_name: "William", last_name: "Rendalson", email: "william@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123659")
user10 = User.create(first_name: "Elijah", last_name: "Ravenbrook", email: "elijah@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123610")
user11 = User.create(first_name: "chris", last_name: "scott", email: "chris@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123611")

massage_service = Service.create(name: "massage", cost: 75)
physio_service = Service.create(name: "physiotherapy", cost: 95)

booking1 = Booking.create(location: 'CBD', date: "Monday", time: "13:00", service_id: massage_service.id, user_id: employee1.id)
booking2 = Booking.create(location: 'CBD', date: "Monday", time: "14:00", service_id: massage_service.id, user_id: employee2.id)
booking3 = Booking.create(location: 'CBD', date: "Monday", time: "15:00", service_id: physio_service.id, user_id: employee3.id)
booking4 = Booking.create(location: 'CBD', date: "Monday", time: "16:00", service_id: physio_service.id, user_id: employee4.id)

address1 = Address.create(user_id: user1.id, street: "street 1", suburb: "suburb 1", state: "vic", postcode: 123)
address5 = Address.create(user_id: user5.id, street: "street 5", suburb: "suburb 5", state: "vic", postcode: 321)


