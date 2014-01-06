class AddAnswersCountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :answers_count, :integer
  end
end
