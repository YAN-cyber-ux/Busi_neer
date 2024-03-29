class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :essay_question_answer, null: false, foreign_key: true

      t.timestamps
    end
  add_index :favorites, [:user_id, :essay_question_answer_id], unique: true
  end
end
