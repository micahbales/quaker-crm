class Individual < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  belongs_to :meeting
end
