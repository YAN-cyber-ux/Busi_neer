class FavoritesController < ApplicationController
  def create
    @essay_question_answer = EssayQuestionAnswer.find(params[:essay_question_answer_id])
    current_user.favorite(@essay_question_answer)
    redirect_back fallback_location: root_path, success: t('.success')
  end

  def destroy
    @essay_question_answer = EssayQuestionAnswer.find(params[:essay_question_answer_id])
    current_user.unfavorite(@essay_question_answer)
    redirect_back fallback_location: root_path, success: t('.success')
  end
end
