Fabricator(:topic) do
  first_subject { Faker::Lorem.sentence(2) }
  second_subject { Faker::Lorem.sentence(2)}
  question { Faker::Lorem.sentence(10) }
end
