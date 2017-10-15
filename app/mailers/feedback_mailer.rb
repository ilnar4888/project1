class FeedbackMailer < ApplicationMailer
    
  default to: ENV["MAILER_FEEDBACK_ADDRESS"]
  
  def email_to_admin(feedback, email)
  	@email = email
  	@feedback = feedback
   	mail(to: @email, subject: "New feedback")
  end
end
