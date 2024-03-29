class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :essay_question_answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_essay_question_answers, through: :favorites, source: :essay_question_answer

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }

  def own?(object)
    id == object.user_id
  end

  def favorite(essay_question_answer)
    favorite_essay_question_answers << essay_question_answer
  end

  def unfavorite(essay_question_answer)
    favorite_essay_question_answers.destroy(essay_question_answer)
  end

  def favorite?(essay_question_answer)
    favorite_essay_question_answers.include?(essay_question_answer)
  end

end
