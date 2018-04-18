# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all

category_list=[
  {name: '中式料理'},
  {name: '日本料理'},
  {name: '義大利料理'},
  {name: '墨西哥料理'},
  {name: '素食料理'},
  {name: '美式料理'},
  {name: '複合式料理'}
]

category_list.each do |t|
  Category.create(name: t[:name])
end
puts 'Category created!'

User.destroy_all
User.create( name:'Ben', email:'ben.bc.lin@gmail.com',password:'12345678', role:'admin', intro:'管理員')
puts 'admin user created!'