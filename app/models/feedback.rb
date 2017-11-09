class Feedback < ApplicationRecord
    
  #name_validates
  validates :name, presence: true, length: { maximum: 50 }

  #email validates
  valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: valid_email }
  validates :email, length: { maximum: 50 }

  #text_validates
  validates :text, presence: true, length: { maximum: 1000 }
  
  scope :all_feedbacks, -> (page) { paginate(page: page, per_page: 5).order(created_at: :desc) }
  scope :search_by_attributes, -> (query, page) { where("name || ' ' || email || ' ' || text ILIKE ?", "%#{query}%").paginate(page: page, per_page: 5).order(created_at: :desc) }
end
