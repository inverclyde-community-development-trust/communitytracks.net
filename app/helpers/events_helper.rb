module EventsHelper
  def event_time(event)
    return if event.time.blank?

    time = event.time
    time.strftime("%l:%M%P, #{time.day.ordinalize} %B")
  end
end
