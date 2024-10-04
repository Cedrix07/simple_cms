class AccessController < ApplicationController
  layout 'admin'

  before_action :confirmed_logged_in, :except => [:login, :attempt_login, :logout]  
  before_action :prevent_login_access_if_authenticated, :only => [:login, :attempt_login]
  before_action :prevent_logout_access_if_unauthenticated, :only => [:logout]


  def index
    
  end

  def login
    # login form 
  end

  def attempt_login
    # if username and password has value 
    if params[:username].present? && params[:password].present?
      #check in database
      found_user = AdminUser.where(:username => params[:username]).first
      # authenticate the found user 
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      # create a session by storing the user ID in the session hash 
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination"
      redirect_to(:action => 'login')
    end

  end

  def logout
    # destroy session to logged out 
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

 
   private 
    def prevent_login_access_if_authenticated
      if session[:user_id]
        flash[:notice] = "You are already logged in"
        redirect_to(:action => "index")
      end
    end

    def prevent_logout_access_if_unauthenticated 
      if !session[:user_id]
        flash[:notice] = "You are not logged in"
        redirect_to(:action => "index")
      end
    end

end
