class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, status: :see_other, flash: { success: t('.success') }
    else
      flash.now[:danger] = t('.failure')
      render :new, status: :unauthorized
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, flash: { success: t('.success') }
  end
end
