# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.where(email:'admin@test.com').first_or_create(password:'592592', password_confirmation:'592592')
User.where(email:'buyer@test.com').first_or_create(password:'592592', password_confirmation:'592592')

Category.where(name:'Cocktail').first_or_create
Category.where(name:'Whisky').first_or_create

Rate.first_or_create(exchange_rate: '8.5')