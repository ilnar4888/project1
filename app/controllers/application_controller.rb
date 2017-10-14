class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper
  include Pundit

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
  private
 
    def user_not_authorized
      flash[:warning] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
