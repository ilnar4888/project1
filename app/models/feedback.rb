class Feedback < ApplicationRecord
 
  #name_validates
  validates :name, presence: true, length: { maximum: 50 }

  #email validates
  valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: valid_email }
  validates :email, length: { maximum: 50 }

  #text_validates
  validates :text, presence: true, length: { maximum: 1000 }
end
