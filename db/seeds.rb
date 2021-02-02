user1 = User.create(first_name: "chris", last_name: "scott", email: "chris@hotmail.com", password: "123456", password_confirmation: "123456", phone_number: "123654")

employee1 = Employee.create(user_id: user1.id, availability: "monday, tuesday, wednesday, thursday")
