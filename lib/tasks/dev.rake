namespace :dev do

  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    @users = User.where(role: 'normal')
    @users.destroy_all
    20.times do |i|
      User.create!(
        name: FFaker::Name.last_name,
        email: FFaker::Internet.free_email,
        password: FFaker::InternetSE.password,
        intro: FFaker::Book.description,
        role: 'normal',
      )
    end
    puts "have created fake normal users"
    puts "now you have #{User.count} Users"
  end

  task fake_comment: :environment do

    Comment.destroy_all
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(content: FFaker::Lorem.sentence,
          restaurant_id: restaurant.id,
          user_id: User.all.sample.id,
      )
      end
    end
    puts "have created fake comments"
  end

end