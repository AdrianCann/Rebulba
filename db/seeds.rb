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
  user_id: 5
  })
  
post_title = ["A quick anecdote",
               "Penny for my thoughts?",
               "Hey Friends!!! Announcement Time:",
               "NEWS FLASH!"]
post_body = ["I am going vegan today. Oh no how will I get my protein? I guess I will have to remember to include leucine rich foods like nuts and beans",
              "Sennacy is a pretty-kitty!",
              "I just bought an RC helicopter and I can't wait to fly it!",
              "My phone is broken so I need numbers. Please."]
  
rebulba_body = ["It was said that only with the wisdom and vast power of Beaker, the Oldest Gaurdian of our Realm was able to thwart the infectious influence of Rebulba. So it is said. But even the ancient ones have a date of expiration. Even those that have shielded the world from forces that would have crumpled our universe to spec smaller than a pin— will one day falter in their duties.",
                  "Rebulba the Shadow Mage reached out from his incomprehensible dimension and used his vast consciousness to cause my roommate to misplace his keys. His influence in our realm is slight but should Rebeaker the Guardian’s protective spell waiver, our entire dimension could be under his control. Although the omniscient Gaurdian’s ancient sorcery has yet to be undone, darkness gathers in the desolate abyss inhabited by Rebulba.",
                  "Rebulba’s sorcery opened a wormhole into our dimension. The god-like being’s mental energy radiated out for light-years from the penetration point. Luckily the breach occurred far from any sentient life. Should the desolate conjurer’s mental energy come into contact with life, our galaxy would be infected. Ancient scrolls from early civilizations describe the dark-mage’s menace as he battled the realm guardians for a hold in our dimension.",
                  "in a dimension incomparable to our own, Rebulba the time sorcerer sent a mental probe across time and space. His vast consciousness engulfed my own in a deadly struggle for my soul. I cried out for Beaker: the Realm Guardian to shield me from my supernatural foe. If my resolve should waiver, the dark one would have a hold in this realm once more."]
rebulba_title = ["The Shadow Grows",
                  "A tale from the ancient world",
                  "This App Brings Us Closer to the Doom we Fear",
                  "The Vanquished Warlock"]

workout_title = ["Day 1 in the Gym", "sweat from the locker-room", "Huge Gains", "U Jelly?"]
workout_body = ["woke up and ate raw eggs then did 25 dips in a row. WHAT DID YOU DO BEFORE WORK?",
                  "Just finished day 1 of crossfit boot camp. And I thought App Acad was hard..",
                  "Pulled my rotator cuff but still finished my workout.",
                  "Running a marathon next week, please sponsor me!"]

4.times do |i|
  Post.create({
    title: rebulba_title[i],
    body: rebulba_body[i],
    user_id: 6
  })
    
  Post.create({
    title: workout_title[i],
    body: workout_body[i],
    user_id: 5
  })
    
  Post.create({title: post_title[rand(4)], body: post_body[rand(5)], user_id: (rand(4)+1)})
    
  Post.create({title: "I love using Rebulba...", body: "I go on it #{i*3} times a day! and then I write things.", user_id: (i+1)})
    
  Post.create!({title: "I just did #{rand(20)+2} push ups!", body: "Right after running #{(rand(6)+2)} miles. I am such a beast. Hear me roar!", user_id: (rand(4)+1)})
    
end




  

Comment.create({post_id: 2, body: "lol agree", user_id: 2})
Comment.create({post_id: 2, body: "So true. On the other hand, my gerbil passed away. RIP", user_id: 4})

comments = ["lol. Love that post. Reminds me that their are other chill users on this site.",
            "lame post",
            "haha",
            "Any chance the seed data on this app could be improved? Thanks.",
            "Oh boy!",
            "THIS IS NOT SPAM! Try out our new credit card sharing service. ITS FREE MONEY!",
            "you have got to learn how to be funny, man",
            "How much sleep did you get before posting this?",
            "oh wow, classic",
            "The user experience of this web-app is great! I have nothing to say about your post. Just felt like commenting to see backbone in action",
            "wow my comment appears instantly! What a great front-end!",
            "somebody should really move the sidebar into backbone...",
            "great web app, great guy. HIRED!",
            "great post. wow. such content. much seed-data. wow. just learn meme. wow.",
            "I am going to have to unfollow you I think..."]

(Post.all.count * 2).times do
  Comment.create({post_id: (rand(Post.all.count)+1), body: comments[rand(comments.count)+1], user_id: (rand(5)+1)})
end

Post.all.each do |post|
  post.likes.create({user_id: 2})
end

Post.all.each do |post|
  post.likes.create({user_id: 3})
end

Post.all.each do |post|
  post.likes.create({user_id: 4})
end

Post.all.each do |post|
  post.likes.create({user_id: 5})
end
