# == Schema Information
#
# Table name: venues
#
#  id         :integer          not null, primary key
#  address    :string
#  venue      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Venue < ApplicationRecord
end
