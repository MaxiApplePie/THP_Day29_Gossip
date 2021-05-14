class UsersController < ApplicationController
  def index
  end

  def create
    puts "*" * 60
    puts params
    puts "*" * 60

    # cherche s'il existe un utilisateur en base avec l’e-mail
    if User.find_by(email: params[:email])
      flash.now[:danger] = "Utilisateur deja en base"
      puts "toto"
      render "new"
    else
      @user = User.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        description: params[:description],
        email: params[:email],
        age: params[:age],
        city_id: City.all.sample.id, #City.find_by(name: params[:city]).id,
        password: params[:password],
      )
      if @user.save
        flash[:success] = "Welcome"
        log_in(@user)
        redirect_to index_path
      else
        render "new"
      end
    end
  end
end
