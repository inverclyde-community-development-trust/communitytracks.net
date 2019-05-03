class ContactSubmissionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_submission_mailer.admin_notification.subject
  #
  def admin_notification(submission)
    @submission = ContactSubmission.find(submission.id)

    mail to: "kieran.wild@the-trust.org.uk; scott.deveney@the-trust.org.uk", subject: "New contact submission"
  end
end
