class VenuesController < ApplicationController
  def index
    matching_venues = Venue.all

    @list_of_venues = matching_venues.order({ :created_at => :desc })

    render({ :template => "venues/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_venues = Venue.where({ :id => the_id })

    @the_venue = matching_venues.at(0)

    render({ :template => "venues/show.html.erb" })
  end

  def create
    the_venue = Venue.new
    the_venue.venue = params.fetch("query_venue")
    the_venue.address = params.fetch("query_address")

    if the_venue.valid?
      the_venue.save
      redirect_to("/venues", { :notice => "Venue created successfully." })
    else
      redirect_to("/venues", { :alert => the_venue.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_venue = Venue.where({ :id => the_id }).at(0)

    the_venue.venue = params.fetch("query_venue")
    the_venue.address = params.fetch("query_address")

    if the_venue.valid?
      the_venue.save
      redirect_to("/venues/#{the_venue.id}", { :notice => "Venue updated successfully."} )
    else
      redirect_to("/venues/#{the_venue.id}", { :alert => the_venue.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_venue = Venue.where({ :id => the_id }).at(0)

    the_venue.destroy

    redirect_to("/venues", { :notice => "Venue deleted successfully."} )
  end
end
