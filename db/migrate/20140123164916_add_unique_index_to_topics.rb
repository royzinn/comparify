class AddUniqueIndexToTopics < ActiveRecord::Migration
  def change
    add_index :topics, [:first_subject, :second_subject, :question], unique: true, name: "index_on_first_second_question_unique"
  end
end
