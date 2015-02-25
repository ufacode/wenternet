# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.delete_all
2.times { City.create(name: Faker::Address.city, uri: Faker::Lorem.word) }
cities = City.all

Category.delete_all
2.times { Category.create(name: Faker::Lorem.word, uri: Faker::Lorem.word) }
categories = Category.all

Subcategory.delete_all
3.times do
  Subcategory.create(
      name:     Faker::Lorem.word,
      uri:      Faker::Lorem.word,
      category: categories.sample
  )
end
subcategories = Subcategory.all

Item.delete_all
2000.times do
  subcategory = subcategories.sample
  Item.create(
      title:       Faker::Name.title,
      price:       Faker::Commerce.price,
      content:     Faker::Lorem.sentence(6),
      city:        cities.sample,
      category:    subcategory.category,
      subcategory: subcategory,
      email:       Faker::Internet.email,
      phone:       Faker::PhoneNumber.cell_phone
  )
end