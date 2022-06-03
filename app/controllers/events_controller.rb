class EventsController < ApplicationController
  def zoom_landing
      render({ :template => "events/zoom_landing.html.erb"})
  end

  def index
    matching_events = Event.all

    @list_of_events = matching_events.order({ :created_at => :desc })

    render({ :template => "events/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_events = Event.where({ :id => the_id })

    @the_event = matching_events.at(0)

    render({ :template => "events/show.html.erb" })
  end

  def create
    speaker_fullname = Speaker.where({ :first_name => params.fetch("query_first_name"), :last_name => params.fetch("query_last_name")})
    if speaker_fullname == nil
      the_speaker = Speaker.new
      the_speaker.bio = params.fetch("query_bio")
      the_speaker.first_name = params.fetch("query_first_name")
      the_speaker.last_name = params.fetch("query_last_name")
      the_speaker.department_id = params.fetch("query_department_id")
      if the_speaker.valid?
        the_speaker.save
      end
      event_speaker_id = the_speaker.id
    else
      event_speaker_id = speaker_fullname.first.id
    end

    the_venue = Venue.new
    the_venue.venue = params.fetch("query_venue")
    the_venue.address = params.fetch("query_address")

    if the_venue.valid?
      the_venue.save
    end

    the_event = Event.new
    the_event.zoom_url = params.fetch("query_zoom_url")
    # the_event.user_id = @current_user.id
    venue_title = params.fetch("query_venue")
    the_event.venue_id = Venue.where({ :venue => venue_title}).first.id
    the_event.department_id = params.fetch("query_department_id")
    the_event.speaker_id = event_speaker_id
    the_event.date = params.fetch("query_event_date")
    the_event.title = params.fetch("query_title")

    if the_event.valid?
      the_event.save
      redirect_to("/events", { :notice => "Event created successfully." })
    else
      redirect_to("/events", { :alert => the_event.errors.full_messages.to_sentence })
    end

  end

  def update
    the_id = params.fetch("path_id")
    the_event = Event.where({ :id => the_id }).at(0)

    the_event.zoom_url = params.fetch("query_zoom_url")
    the_event.user_id = params.fetch("query_user_id")
    the_event.speaker_id = params.fetch("query_speaker_id")
    the_event.venue_id = params.fetch("query_venue_id")
    the_event.department_id = params.fetch("query_department_id")
    the_event.title = params.fetch("query_title")

    if the_event.valid?
      the_event.save
      redirect_to("/events/#{the_event.id}", { :notice => "Event updated successfully."} )
    else
      redirect_to("/events/#{the_event.id}", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_event = Event.where({ :id => the_id }).at(0)

    the_event.destroy

    redirect_to("/events", { :notice => "Event deleted successfully."} )
  end
end
