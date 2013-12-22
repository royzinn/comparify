class CreateTopic < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :first_subject
      t.string :second_subject
      t.text :question
      t.timestamps
    end

    add_index :topics, :first_subject
    add_index :topics, :second_subject
    add_index :topics, [:first_subject, :second_subject]

  end
end
