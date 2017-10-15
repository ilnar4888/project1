class SendEmailToAdmin
  include Interactor

  delegate :feedback, to: :context
  delegate :admin_users, to: :context

  def call
    sent_email
  end

  private
  
  def sent_email
    admin_users.each do |user|
      FeedbackMailer.email_to_admin(feedback, user.email).deliver
      Rails.logger.debug("feedback: #{feedback.name}, user: #{user.full_name}")
    end
  end
end