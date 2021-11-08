namespace :dev do
  task fake: :environment do
    names = %w[horace bob alice chuck scott alan gary ryan steven rick]
    # Use dummy password so we can log in if needed
    10.times { |i| User.create!(email: "#{names[i]}@gmail.com", password: '123456') }

    user_ids = User.pluck(:id)

    50.times { Recipe.create!(user_id: user_ids.sample, dish: Faker::Food.dish, description: Faker::Food.description) }
  end
end
