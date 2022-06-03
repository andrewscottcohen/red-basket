# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Department < ApplicationRecord
  belongs_to :user, :required => true
  belongs_to :speaker, :required => true

  has_many :users

end
