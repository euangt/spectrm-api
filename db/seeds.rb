require 'faker'

10.times do 
  Message.create (
    content: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4,
  )
end
