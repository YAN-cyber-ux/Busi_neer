class EssayQuestionAnswersController < ApplicationController
  def index
    @essay_question_answers = EssayQuestionAnswer.all.includes(:user).order(created_at: :desc)
  end
end
