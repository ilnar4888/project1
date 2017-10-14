class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    @feedbacks = Feedback.all
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
      redirect_to @feedback, notice: 'Feedback was successfully send!'
    else
      render :new
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
end
