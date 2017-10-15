class FeedbacksController < ApplicationController
 
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  before_action :initialize_user_attr, only: [:new, :edit]
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
  
  def index
    @feedbacks = Feedback.where(email: current_user.email)
  end

  def show
  end

  def new
    @feedback = Feedback.new 
  end

  def edit
  end

  def create  
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      SendEmailToAdmin.call(feedback: @feedback, admin_users: User.where(admin: true)) unless user_signed_in?
      redirect_to @feedback, notice: 'Feedback was successfully send!'
    else
      flash[:notice] = "Error"
      render "new"
    end
  end

  def update
    if @feedback.update(feedback_params)
      redirect_to @feedback, notice: 'Feedback was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @feedback.destroy
    redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.'
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:name, :email, :text)
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
