5.times do
  Evaluation.create(
    title: Faker::Lorem.word,
    services: Faker::Lorem.word,
    language: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
  )
end
