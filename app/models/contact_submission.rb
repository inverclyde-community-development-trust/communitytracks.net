class ContactSubmission < ApplicationRecord
  after_create :notify_admin
  validates :email, presence: true
  validates :text, presence: true

  private

  def notify_admin
    ContactSubmissionMailer.admin_notification(self).deliver_later
  end
end
