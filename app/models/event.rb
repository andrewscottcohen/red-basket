# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  date          :string
#  title         :string
#  zoom_url      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#  speaker_id    :integer
#  user_id       :integer
#  venue_id      :integer
#
class Event < ApplicationRecord
  belongs_to :speaker
  belongs_to :venue
  belongs_to :department

  has_many :bookmarks
end
