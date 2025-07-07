class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password]) && user.acc_status == "Active"
        session[:user_id] = user.id
        session[:fname] = user.fname
        session[:is_admin] = user.is_admin
  
        if user.is_admin?  
          redirect_to admin_path, notice: "Logged in successfully!"
        else
          redirect_to userhome_path, notice: "Logged in successfully!"
        end
      else
        flash.now[:error] = "Invalid email or password. Please try again."
        render :new
      end
    end
  
    def destroy
      session[:user_id] = nil
      session[:fname] = nil
      session[:is_admin] = nil
      redirect_to root_path, notice: "Logged out successfully!"
    end
  end
  