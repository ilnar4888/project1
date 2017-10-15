class User < ApplicationRecord
	before_save :first_user_is_admin
  
  devise :database_authenticatable, 
         :registerable, 
         :confirmable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable

  validates :full_name, presence: true

  private 
    def first_user_is_admin
      self.admin = true if User.count == 0
    end
end
