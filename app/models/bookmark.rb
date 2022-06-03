# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord
  belongs_to :user, :required => true
  belongs_to :event, :required => true
end
