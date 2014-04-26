# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all
Following.destroy_all

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

post_title = ["Some Thoughts of Mine", "Penny for my thoughts", "Hey Friends", "NEWS FLASH!"]
post_body = ["I am going vegan today", "My gerbil passed away. RIP.", "cats make great pets", "my life rocks!"]

6.times do |i|
  Post.create!(title: "I love using Rebulba...", body: "I go on it #{i*3} times a day!", user_id: (i+1))
end

20.times do |i|
  Post.create!(title: post_title[rand(4)], body: post_body[rand(4)], user_id: (rand(6)+1))
end

6.times do |i|
  Post.create!(title: "I just did #{rand(20)+2} push ups!.", body: "Right after running #{(rand(5)+2)} miles", user_id: (i+1))
end

Comment.create({post_id: 2, body: "lol agree", user_id: 2})
Comment.create({post_id: 2, body: "So true", user_id: 4})

comments = ["lol", "lame post", "haha", "troll!", "spam spam spam"]

100.times do
  Comment.create!(post_id: (rand(25)+1), body: comments[rand(4)], user_id: (rand(6)+1))
end

