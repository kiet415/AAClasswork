# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = Todo.create!({title:'running', body:'back home', done: false})
b = Todo.create!({title:'lift weights', body:'at gym', done: false})
c = Todo.create!({title:'eating', body:'lasagna', done: false})
d = Todo.create!({title:'coding', body:'at school', done: true})
e = Todo.create!({title:'sleeping', body:'for 8 hours', done: false})