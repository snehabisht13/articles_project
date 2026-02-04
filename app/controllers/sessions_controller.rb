class SessionsController < ApplicationController

def new
end

def create
   @user = User.find_by(email: params[:sessions][:email].downcase)
   if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
    #   redirect_to user_path(@user)
    redirect_to root_path
   else
      flash.now[:alert] = "Invalid email or password"
      render :new
   end
end

def destroy
   session[:user_id] = nil
   redirect_to root_path
   flash[:notice] = "You have been logged out."
end


end