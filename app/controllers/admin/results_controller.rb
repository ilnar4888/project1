class Admin::ResultsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :require_admin

  def search
    @feedbacks = Feedback.search_everywhere(params[:query])
    render "feedbacks/index"
  end

  private
    
    def feedback_params
      params.require(:feedback).permit(:name, :email, :text)
    end

    def require_admin
      redirect_to root_path unless current_user.admin?
    end
end