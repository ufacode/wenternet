
def translite(str)
  Russian::translit(str).downcase.gsub(/\W+/, '-')
end

cities = [["Уфа","ufa"], ["Стерлитамак","sterlitamak"], ["Казань","kazan"], ["Москва","moscow"]]
City.delete_all
cities.each { |city| City.create(name: city[0], uri: city[1]) }
cities = City.all

categories = [
    ["Авто и мото", ["Продажа", "Покупка", "Сервис", "Услуги", "Другое"]],
    ["Недвижимость", ["Продажа", "Покупка", "Ипотека", "Сервис", "Услуги", "Другое"]],
    ["Компьютерная техника", ["Продажа", "Покупка", "Сервис", "Услуги", "Другое"]],
    ["Одежка, обувь, аксессуары", ["Продажа", "Покупка", "Сервис", "Услуги", "Другое"]],
    ["Работа и образование", ["Поиск работы", "Вакансии", "Курсы и обучение", "Другое"]],
]
Category.delete_all
Subcategory.delete_all
categories.each do |row|
  print '.'
  category = Category.create(name: row[0], uri: translite(row[0]))
  row[1].each{ |subcategory| Subcategory.create(name: subcategory, uri: translite(subcategory), category: category) }
end
subcategories = Subcategory.all

User.delete_all
password = "password"
30.times do
  user = User.new(
      name: Faker::Name.name,
      email:  Faker::Internet.safe_email,
      password: password,
      password_confirmation: password
  )
  user.skip_confirmation!
  user.save
end
users = User.all

Item.delete_all
2000.times do
  print '.'
  subcategory = subcategories.sample
  Item.create(
      title:       Faker::Name.title,
      price:       Faker::Commerce.price,
      content:     Faker::Lorem.sentence(6),
      city:        cities.sample,
      category:    subcategory.category,
      subcategory: subcategory,
      user:        users.sample,
      email:       Faker::Internet.email,
      phone:       Faker::PhoneNumber.cell_phone
  ).publish!
end
