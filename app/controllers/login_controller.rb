class LoginController < ApplicationController

  layout "login"
  
  def login
  end

  def attempt_login

    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = 'Successfully logged in.'
      redirect_to(index_index_path)
    else
      flash.now[:notice] = "Invalid Username/Password Combination."
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'Logged out'
    redirect_to(login_login_path)
  end

end
