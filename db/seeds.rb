
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])


#   Mayor.create(name: 'Emanuel', city: cities.first)

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end

User.create!(
        email: "gb87@wp.pl",
        firstname: "Grzegorz",
        lastname: "Bugała",
        password: "energy87",      
        admin: true
      ) 

User.create!(
        email: "jjanna56@wp.pl",
        firstname: "Joanna",
        lastname: "Bugała",
        password: "pass1234",  
        admin: false      
      ) 
3.times do
	# email = Faker::Internet.email,
	 #firstname = Faker::Name.first_name,
	 #lastname = Faker::Name.last_name,
     User.create!(
        email: Faker::Internet.email,
        firstname: Faker::Name.first_name,
        lastname: Faker::Name.last_name,
        password: "password", 
        admin: false       
      ) 
end 
#
users = User.all
10.times do |n|
   name =  Faker::Lorem.word + n.to_s
   time = rand_time(4.days.ago, 2.days.ago)
   Category.create!(name: name, created_at: time, updated_at: time)
end


categories = Category.all

10.times do
	categories.each do |category|        	
		price = rand(100)
        value = rand(14)
		user = users.shuffle.sample
        time = rand_time(2.days.ago, 1.day.ago)

		user.products.create!(title: Faker::Lorem.word, description: Faker::Lorem.sentence(value), price: price, created_at: time, updated_at: time, category_id: category.id, user_id: user.id)
	end
end

products = Product.all
20.times do
	products.each do |product|
		user = users.shuffle.sample
		time = time = rand_time(1.day.ago, Time.now)
		user.reviews.create!( content: Faker::Lorem.sentence(rand(12)), rating: rand(1..5),  created_at: time,  updated_at: time,  product_id: product.id,  user_id: user.id )
	end
end
