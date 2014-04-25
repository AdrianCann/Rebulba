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
  email: 'sara@hot.com',
  password: "i love adrian"})

User.create({
  username: "Adrian",
  email: 'atcann@bu.edu',
  password: "123456"})

User.create({
  username: "Andrew",
  email: 'andrew@roommate.com',
  password: "123456"})

User.create({
  username: "Jorge",
  email: 'jorge@chill.com',
  password: "123456"})

User.create({
  username: "Jorge-Sister",
  email: 'jorgesister@chill.com',
  password: "123456"})

Post.create({
  title: "Sam",
  body: "My brother's best friend made this app",
  user_id: 2})

Post.create({
  title: "Best Friend",
  body: "My best friend is Adrian! He is cool and not weird for eating a lot",
  user_id: 1})

Post.create({
  title: "Jeans",
  body: "Sam wore jeans. they wore blue. Our outfits matched as they should.",
  user_id: 3})

Post.create({
  title: "Who let the dogs out?",
  body: "Seriously, who let them out because I am very allergic",
  user_id: 12})

Comment.create({post_id: 2, body: "lol agree", user_id: 2})
Comment.create({post_id: 2, body: "So true", user_id: 4})