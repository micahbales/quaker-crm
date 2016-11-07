class Individual < ApplicationRecord
  validates :name, presence: true

  belongs_to :meeting
end
