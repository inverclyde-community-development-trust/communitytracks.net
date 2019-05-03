class WardsController < ApplicationController
  layout "ward"
  def show
    ward = Ward.find_by(url_slug: ward_params[:slug])
    @ward_data = ward.as_json
    @ward_councillors = Councillor.where("ward_id = ?", ward.id)
  end

  private

  def ward_params
    params.permit(:slug)
  end
end
