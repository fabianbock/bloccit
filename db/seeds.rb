require 'faker'
 
 Post.create!(
  title: "My post",
  body: "This is Fabian's post"
  )

Comment.create!(
  body: "blablabla",
  )
 # Create Posts
=begin 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
=end

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"