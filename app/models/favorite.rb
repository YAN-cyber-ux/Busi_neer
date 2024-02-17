class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :essay_question_answer

  validates :user_id, uniqueness: { scope: :essay_question_answer_id }
end
