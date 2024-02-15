class EssayQuestionAnswersController < ApplicationController
  def index
    @essay_question_answers = EssayQuestionAnswer.all.includes(:user).order(created_at: :desc)
  end

  def new
    @essay_question_answer = EssayQuestionAnswer.new
  end

  def create
    @essay_question_answer = current_user.essay_question_answers.build(essay_question_answer_params)
    if @essay_question_answer.save
      redirect_to essay_question_answers_path, status: :see_other, flash: { success: t('defaults.message.created', item: EssayQuestionAnswer.model_name.human) }
    else
      flash.now[:danger] = t('defaults.message.not_created', item: EssayQuestionAnswer.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @essay_question_answer = EssayQuestionAnswer.find(params[:id])
  end

  private

  def essay_question_answer_params
    params.require(:essay_question_answer).permit(:title, :body)
  end
end
