class SessionsController < ApplicationController
  def new
  end

  def create
    puts "#########################################"

    @user = User.find_by(email:user_params[:email])
    
    puts "#########################################"

    if @user && @user.authenticate(user_params[:password])
      sessions[:user_id] = @user.id

      puts "#########################################"

      puts sessions.inspect
      puts sessions[:user_id]
      flash[:success] = "Tu es connecté"
      redirect_to root_path

    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    #session[:user_id] = nil
    session.delete(:user_id)
    flash[:danger] = 'Tu es déconnecté ! A bientôt'
    redirect_to root_path, notice: 'Tu es déconnecté ! A bientôt'
  end

  private 
  
  def user_params
     params.require(:user).permit(:email, :password)
   end

end
