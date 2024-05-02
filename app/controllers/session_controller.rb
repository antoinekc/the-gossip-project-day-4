class SessionController < ApplicationController
  def new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: params[:user][:email])
  
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = "Tu es connecté"
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    #session.delete(:user_id)
    flash[:danger] = 'Tu es déconnecté ! A bientôt'
    redirect_to root_path, notice: 'Tu es déconnecté ! A bientôt'
  end

  private 
  
  def password_param
    params[:session][:password]
  end

end
