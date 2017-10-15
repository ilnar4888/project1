class FeedbackPolicy
  attr_reader :current_user, :feedback

  def initialize(current_user, feedback)
    @current_user = current_user
    @feedback = feedback
  end

  def index?
    @current_user.admin? 
  end

  def new?
    @current_user.admin?
  end

  def create?
    @current_user.admin?
  end

  def show?
    @current_user.admin?
  end

  def edit?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end
end