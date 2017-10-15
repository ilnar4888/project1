class Admin::Results < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :require_admin
  
  def index
    @feedbacks = Feedback.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
    Rails.logger.debug(" jkkkbbk#{current_user.admin?}")
  end

  def search
  end

  private
    
    def feedback_params
      params.require(:feedback).permit(:name, :email, :text)
    end

    def require_admin
      redirect_to root_path unless current_user.admin?
    end
end