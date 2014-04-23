# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({
  username: "Sam Sweeney",
  email: 'sam.s.sweeney@gmail.com',
  password: "i love adrian"})

User.create({
  username: "Sara Sweeney",
  email: 'sara',
  password: "i love adrian"})

User.create({
  username: "Adrian",
  email: 'atcann@bu.edu',
  password: "123456"})