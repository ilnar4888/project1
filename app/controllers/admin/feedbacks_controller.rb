class Admin::FeedbacksController < ApplicationController
  layout "admin"
  
  before_action :authenticate_user!
  before_action :authorize_admin!, except: [:index]
  before_action :initialize_user_attr, only: [:new, :edit]
  
  expose :feedback
  expose :feedbacks, -> { requests_feedbacks }   
  
  def index
    authorize Feedback
  end

  def show
  end

  def new
  end

  def edit
    authorize feedback
  end

  def create  
    feedback.save
    respond_with :admin, feedback
  end

  def update
    feedback.update(feedback_params)
    respond_with :admin, feedback
  end

  def destroy
    feedback.destroy
    respond_with :admin, feedbacks
  end

  private
    
    def feedback_params
      params.require(:feedback).permit(:name, :email, :text)
    end

    def initialize_user_attr
      @user_name = current_user.full_name 
      @user_email = current_user.email
    end
    
    def authorize_admin!
      authorize feedback
    end

    def requests_feedbacks
      if params[:query].present?
        Feedback.search_by_attributes(params[:query], params[:page])
      else  
        Feedback.all_feedbacks(params[:page])
      end
    end
end