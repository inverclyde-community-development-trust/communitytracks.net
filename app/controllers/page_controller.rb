class PageController < ApplicationController
  def home
    ward = Ward.includes(:map_layers).find_by(show_on_homepage: true)
    @ward_data = ward.as_json
    @events = Event.order(time: :asc).limit(4).where(time: 1.days.from_now..DateTime::Infinity.new)
    @posts = Post.order(created_at: :asc).limit(3)
  end

  def about
  end

  def ssl
  end
end
