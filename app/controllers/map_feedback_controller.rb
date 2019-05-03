class MapFeedbackController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    if MapFeedback.create(map_feedback_params)
      render json: {success: true}, status: :created
    else
      render json: {success: false}, status: :bad_request
    end
  end

  private

  def map_feedback_params
    params.require(:map_feedback).permit(:email, :map_layer_id, :text, :route_name)
  end
end
