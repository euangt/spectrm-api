require 'faker'

10.times do 
  Message.create!(
    content: 'test message',
    retrieval_count: rand(1..20),
  )
end