class EssayQuestionAnswer < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 1000 }
end
