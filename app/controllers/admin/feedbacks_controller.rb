class Admin::FeedbacksController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  before_action :initialize_user_attr, only: [:new, :edit]
  before_action :require_admin
  
  def index
    @feedbacks = Feedback.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
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
      redirect_to admin_feedback_path(@feedback), notice: 'Feedback was successfully send!'
    else
      flash[:notice] = "Error"
      render new_admin_feedback_path
    end
  end

  def update
    if @feedback.update(feedback_params)
      redirect_to admin_feedback_path(feedback), notice: 'Feedback was successfully updated.'
    else
      render edit_admin_feedback_path
    end
  end

  def destroy
    @feedback.destroy
    redirect_to admin_feedbacks_path, notice: 'Feedback was successfully destroyed.'
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:name, :email, :text)
    end

    def initialize_user_attr
      @user_name = current_user.full_name 
      @user_email = current_user.email
    end

    def require_admin
      redirect_to root_path unless current_user.admin?
    end
end