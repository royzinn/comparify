namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_categories
    make_users
    make_topics
    make_answers
    make_relationships
  end
end

def make_categories
  ["Education", "Technology", "Fashion", "Sports", "Politics", "Gossip", "Business", "Entrepreneurship", "Shopping"].each do |c|
    Category.create!(name: c)
  end
end

def make_users
  # admin = User.create!(name:     "Example User",
  #                      email:    "example@railstutorial.org",
  #                      password: "foobar",
  #                      password_confirmation: "foobar",
  #                      admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "roy#{n+1}@example.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password)
  end
end

def make_topics
  users = User.all
  users.each do |user|
    2.times do
      first_subject = Faker::Company.name
      second_subject = Faker::Company.name
      question = Faker::Lorem.sentence(10)
      categor_id = Category.all.sample.id
      topic_tags = (1..5).inject([]) {|arr, x| arr << Faker::Internet.domain_word; arr}
      user.topics.create!(first_subject: first_subject,
                          second_subject: second_subject,
                          category_id: category_id,
                          question: question,
                          tag_list: topic_tags)
    end
  end
end

def make_answers
  topics = Topic.all
  users = User.last(6)
  topics.each do |topic|
    body = Faker::Lorem.sentence(30)
    users.each { |user| topic.answers.create!(body: body,
                                              referred_subject: [:first, :second].sample,
                                              user_id: user.id) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
