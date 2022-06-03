# == Schema Information
#
# Table name: speakers
#
#  id            :integer          not null, primary key
#  bio           :text
#  first_name    :string
#  image         :string
#  last_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#  event_id      :integer
#
class Speaker < ApplicationRecord
  belongs_to :department, :required => true
  has_many :events
end
