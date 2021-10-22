# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.destroy_all

100.times do 
    Book.create(
        title: Faker::Book.title,
        description: Faker::Lorem.paragraph,
        state: 0,
    )    
end    