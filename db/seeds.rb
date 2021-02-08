user1 = User.create(first_name: "Olivia", last_name: "Judge", email: "olivia@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123651")
employee1 = Employee.create(user_id: user1.id, availability: "Monday")

user2 = User.create(first_name: "Liam", last_name: "Tens", email: "liam@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123652")
employee2 = Employee.create(user_id: user2.id, availability: "Monday, Tuesday")

user3 = User.create(first_name: "Emma", last_name: "Waldorf", email: "emma@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123653")
employee3 = Employee.create(user_id: user3.id, availability: "Monday, Tuesday, Wednesday")

user4 = User.create(first_name: "Ava", last_name: "McKenzie", email: "ava@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123654")
employee4 = Employee.create(user_id: user4.id, availability: "Monday, Tuesday, Wednesday, Thursday")

user5 = User.create(first_name: "Noah", last_name: "Rains", email: "noah@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123655")
user6 = User.create(first_name: "Sophia", last_name: "Jenkins", email: "sophia@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123656")

massage_service = Service.create(name: "massage", cost: 75)
physio_service = Service.create(name: "physiotherapy", cost: 95)

booking1 = Booking.create(location: 'CBD', date: "Monday", time: "13:00", service_id: massage_service.id, user_id: employee1.id)
booking2 = Booking.create(location: 'CBD', date: "Monday", time: "14:00", service_id: massage_service.id, user_id: employee2.id)
booking3 = Booking.create(location: 'CBD', date: "Monday", time: "15:00", service_id: physio_service.id, user_id: employee3.id)
booking4 = Booking.create(location: 'CBD', date: "Monday", time: "16:00", service_id: physio_service.id, user_id: employee4.id)

address1 = Address.create(street: '1 street', suburb: 'suburb', state: 'state', postcode: '3001', user_id: user1.id)
address2 = Address.create(street: '2 street', suburb: 'suburb', state: 'state', postcode: '3002', user_id: user2.id)
address3 = Address.create(street: '3 street', suburb: 'suburb', state: 'state', postcode: '3003', user_id: user3.id)
address4 = Address.create(street: '4 street', suburb: 'suburb', state: 'state', postcode: '3004', user_id: user4.id)
address5 = Address.create(street: '5 street', suburb: 'suburb', state: 'state', postcode: '3005', user_id: user5.id)
address6 = Address.create(street: '6 street', suburb: 'suburb', state: 'state', postcode: '3006', user_id: user6.id)