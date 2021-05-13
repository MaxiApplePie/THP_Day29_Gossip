class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    puts "*" * 60
    puts user
    if user && user.authenticate(params[:password])
      puts "*" * 60
      log_in user
      redirect_to "/welcome/:first_name"
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to index_path
  end
end
