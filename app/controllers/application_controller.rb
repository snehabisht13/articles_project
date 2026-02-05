class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :currUser
  helper_method :logged_in?

    def currUser
         @currUser ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!currUser
    end

    def require_user
        if !logged_in?
            flash[:notice] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end

    


    end 