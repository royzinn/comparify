class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :referred_subject
      t.references :user, index: true
      t.references :topic, index: true
      t.timestamps
    end
  end
end
