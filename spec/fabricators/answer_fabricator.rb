Fabricator(:answer) do
  body { Faker::Lorem.sentence(10) }
end
