class Meeting < ApplicationRecord
  validates :name, presence: true
  validates :user_id, presence: true

  has_many :individuals
  belongs_to :user
end
