# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
raise "Make sure you're in your dev environment!" unless Rails.env.development?

if Rails.env.development?
  puts "Clearing the db...."
  Quote.destroy_all


  quote_generator_classes = [Faker::Quote, Faker::Lorem]

  55.times do |n|
    puts "Creating quote ##{n + 1}..."

    generator = quote_generator_classes.sample

    quote = if generator == Faker::Quote
              Faker::Quote.yoda
            elsif generator == Faker::Lorem
              Faker::Lorem.paragraph(sentence_count: (2..6).to_a.sample)
            end

    Quote.create(
      text: quote,
      source: [Faker::Internet.url, Faker::Book.title].sample,
      author: Faker::FunnyName.two_word_name
    )
  end
end
