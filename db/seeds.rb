5.times do
  name = Faker::Book.title
  phone_number = Faker::PhoneNumber.phone_number
  address = Faker::Address.street_address
  category = "chinese"
  # content = Faker::Books::Lovecraft.paragraph
  Restaurant.create(name: name, phone_number: phone_number, address: address, category: category)
  puts "done"
end
