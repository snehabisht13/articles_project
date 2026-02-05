class UsersController < ApplicationController
    before_action :require_user, except: [:new,:create,:show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def new 
     @user = User.new
    end

    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "User created"
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Profile updated"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end

    def destroy 
        @currUser.destroy if @currUser.admin?
        flash[:notice] = "User and all articles created by user deleted"
        redirect_to articles_path
    end

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def require_same_user
        @user = User.find(params[:id])
        if currUser != @user
            flash[:alert] = "You can only edit your own profile"
            redirect_to @user
        end
    end

end