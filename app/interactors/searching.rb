class Searching
  include Interactor

  delegate :query, to: :context

  def call
    search_feedbacks
  end

  private

    def search_feedbacks
      if query.present?
        Feedback.where("name || ' ' || email || ' ' || text ILIKE ?", "%query%").paginate(page: params[:page], per_page: 5).order(created_at: :desc)
      else
        Feedback.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
      end
    end
end
