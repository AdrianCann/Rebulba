# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.destroy_all
# Post.destroy_all
# Comment.destroy_all
# Like.destroy_all
# Following.destroy_all

User.create({
  username: "Demo User",
  email: "Demo-User@example.com",
  password: "123456"
})

User.create({
  username: "Sam Sweeney",
  email: 'sam.s.sweeney@gmail.com',
  password: "123456"})

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
  username: "Tiffany",
  email: "tiffany@gmail.com",
  password: "123456"
})

(1..6).each do |i|
  (1..6).each do |j|
    Following.create({followee_id: i, follower_id: j}) unless i == j
  end
end

Post.create({
  title: "Great Friendships Last",
  body: "I think it is great how Adrian and Sam are best friends",
  user_id: 1})

Post.create({
  title: "Best Friend",
  body: "My best friend is Adrian! He is cool and not weird for eating a lot",
  user_id: 2})

Post.create({
  title: "Jeans",
  body: "Sam wore jeans. they wore blue. Our outfits matched as they should.",
  user_id: 3})

Post.create({
  title: "Who let the dogs out?",
  body: "Seriously, who let them out because I am very allergic",
  user_id: 5})

post_title = ["Some Thoughts of Mine", "Penny for my thoughts", "Hey Friends", "NEWS FLASH!"]
post_body = ["I am going vegan today. Oh no how will I get my protein? I guess I will have to remember to include leucine rich foods like nuts and beans", "My gerbil passed away. RIP.", "cats make great pets", "my life rocks!",
  "Sennacy is a pretty-kitty!"]

6.times do |i|
  Post.create!(title: "I love using Rebulba...", body: "I go on it #{i*3} times a day!", user_id: (i+1))
end

10.times do |i|
  Post.create!(title: post_title[rand(4)], body: post_body[rand(5)], user_id: (rand(6)+1))
end

6.times do |i|
  Post.create!(title: "I just did #{rand(20)+2} push ups!", body: "Right after running #{(rand(5)+2)} miles. I am such a beast. Hear me roar!", user_id: (i+1))
end

Comment.create({post_id: 2, body: "lol agree", user_id: 2})
Comment.create({post_id: 2, body: "So true", user_id: 4})

comments = ["lol. Love that post. Reminds me that their are other chill users on this site.", "lame post", "haha", "troll!", "spam spam spam comment. Try out our new credit card sharing service."]

20.times do
  Comment.create!(post_id: (rand(25)+1), body: comments[rand(4)], user_id: (rand(6)+1))
end

