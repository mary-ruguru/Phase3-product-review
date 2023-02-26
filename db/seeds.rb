puts "🌱 Seeding data..."

50.times do
 
   review = Review.create(
      star_rating: rand(1..10),
      comment: Faker::Lorem.sentence,
      product_id: rand(1..20),
      user_id:  rand(1..20)
    )

end
   


puts "🌱 Done seeding!"


