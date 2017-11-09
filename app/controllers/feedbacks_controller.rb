class FeedbacksController < ApplicationController
 
  before_action :initialize_user_attr, only: :new
  before_action :authenticate_user!, only: :index
  after_action :send_email, only: :create

  expose :feedback
  expose :feedbacks, -> { Feedback.where(name: current_user.full_name) }
  
  def index
  end

  def show
  end

  def new
  end

  def create  
    feedback.save
    respond_with feedback
  end

  private

    def feedback_params
      params.require(:feedback).permit(:name, :email, :text)
    end

    def send_email
      SendEmailToAdmin.call(feedback: feedback, admin_users: User.where(admin: true)) if !user_signed_in?
    end

    def initialize_user_attr
      if user_signed_in?
        @user_name = current_user.full_name 
        @user_email = current_user.email
      else
        @user_name = nil 
        @user_email = nil
      end
    end
end
