desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

10.times do 
    department = Department.new
    department.title = Faker::Educator.subject
    department.save
end

  p "Added #{Department.count} departments"

    
10.times do 
    venue = Venue.new
    venue.venue = Faker::Movies::StarWars.planet
    venue.address = Faker::Address.full_address
    venue.save
end

  p "Added #{Venue.count} venues"

  
  photos = ["https://tinyurl.comy6hk6oep", "https://tinyurl.com/y5uszprj", "https://picsum.photos/200"]
  departments = Department.all
25.times do 
  user = User.new
  user.first_name = Faker::Movies::PrincessBride.character.split(' ').first
  user.last_name = Faker::Movies::PrincessBride.character.split(' ').last
  user.bio = Faker::Movies::PrincessBride.quote
  user.department_id = departments.sample.id
  user.image = photos.sample
  user.password = "password"
  user.save
end

  p "Added #{User.count} users"

  events = Event.all
25.times do 
  speaker = Speaker.new
  speaker.first_name = Faker::Movies::StarWars.character.split(' ').first
  speaker.last_name = Faker::Movies::StarWars.character.split(' ').last
  speaker.bio = Faker::Movies::StarWars.quote
  speaker.department_id = departments.sample.id
  speaker.image = photos.sample
  # speaker.event_id = events.sample.id
  speaker.save
end

  users = User.all
  speakers = Speaker.all
  venues = Venue.all
  links = ["/url_testing_page", nil, "https://uchicago.zoom.us/j/7755348459?pwd=MVVpK3k0VVd2RUgxWTRzSmlUYUJqUT09"]
  10.times do 
    event = Event.new
    event.title = Faker::Movies::StarWars.call_sign
    event.user_id = users.sample.id
    event.speaker_id = speakers.sample.id
    event.department_id = departments.sample.id
    event.venue_id = venues.sample.id
    event.zoom_url = links.sample
    event.date = Faker::Date.in_date_period(month: 4)
    event.save
  end

  p "Added #{Event.count} Events"

  events = Event.all 
end
