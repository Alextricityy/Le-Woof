# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   params.require(:dog).permit(:name, :description, :breed, :gender, :image_url, :size, :price
# User.create!({ na})

user = User.find_by(email: 'alex@alex.com')
Dog.create!({ name: "rover", user: user, description: "he is a good boy", breed: "border collie" ,photo:"dunno", size: "Medium", price: 50, gender: "Male"})
