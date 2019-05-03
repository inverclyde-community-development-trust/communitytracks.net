class ContactSubmissionsController < ApplicationController
  # GET /contact_submissions/new
  def new
    @contact_submission = ContactSubmission.new
  end

  # POST /contact_submissions
  # POST /contact_submissions.json
  def create
    @contact_submission = ContactSubmission.new(contact_submission_params)

    if @contact_submission.save
      redirect_to contact_path, success: 'Contact submission was successfully created.'
    else
      redirect_to contact_path, error: 'Failed to submit'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_submission_params
    params.require(:contact_submission).permit(:email, :text)
  end
end
