class FavoritesController < ApplicationController
  def create
    @essay_question_answer = EssayQuestionAnswer.find(params[:essay_question_answer_id])
    current_user.favorite(@essay_question_answer)
    redirect_to essay_question_answers_path, success: t('.success')
  end

  def destroy
    essay_question_answer = current_user.favorites.find_by(essay_question_answer_id: params[:id]).essay_question_answer #find(:params[:id])にするとエラーが出る
    current_user.unfavorite(essay_question_answer)
    redirect_to essay_question_answers_path, success: t('.success'), status: :see_other
  end
end
