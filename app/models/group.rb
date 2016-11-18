class Group < ApplicationRecord
  validates :name, presence: true
  validates :meeting_id, presence: true

  belongs_to :meeting
  has_many :group_assignments
  has_many :individuals, through: :group_assignments
end
