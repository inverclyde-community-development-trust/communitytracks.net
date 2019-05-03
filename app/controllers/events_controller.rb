class EventsController < ApplicationController
  def index
    @events = Event.order(time: :asc).where(time: 1.days.from_now..DateTime::Infinity.new)
  end
end
