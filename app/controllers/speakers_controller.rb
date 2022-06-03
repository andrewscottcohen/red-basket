class SpeakersController < ApplicationController
  def index
    matching_speakers = Speaker.all

    @list_of_speakers = matching_speakers.order({ :created_at => :desc })

    render({ :template => "speakers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_speakers = Speaker.where({ :id => the_id })

    @the_speaker = matching_speakers.at(0)

    render({ :template => "speakers/show.html.erb" })
  end

  def create
    the_speaker = Speaker.new
    the_speaker.bio = params.fetch("query_bio")
    the_speaker.first_name = params.fetch("query_first_name")
    the_speaker.last_name = params.fetch("query_last_name")
    the_speaker.department_id = params.fetch("query_department_id")

    if the_speaker.valid?
      the_speaker.save
      redirect_to("/speakers", { :notice => "Speaker created successfully." })
    else
      redirect_to("/speakers", { :alert => the_speaker.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_speaker = Speaker.where({ :id => the_id }).at(0)

    the_speaker.bio = params.fetch("query_bio")
    the_speaker.first_name = params.fetch("query_first_name")
    the_speaker.last_name = params.fetch("query_last_name")
    the_speaker.department_id = params.fetch("query_department_id")

    if the_speaker.valid?
      the_speaker.save
      redirect_to("/speakers/#{the_speaker.id}", { :notice => "Speaker updated successfully."} )
    else
      redirect_to("/speakers/#{the_speaker.id}", { :alert => the_speaker.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_speaker = Speaker.where({ :id => the_id }).at(0)

    the_speaker.destroy

    redirect_to("/speakers", { :notice => "Speaker deleted successfully."} )
  end
end
