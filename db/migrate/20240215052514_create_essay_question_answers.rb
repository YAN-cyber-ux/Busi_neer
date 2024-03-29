class CreateEssayQuestionAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :essay_question_answers do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
