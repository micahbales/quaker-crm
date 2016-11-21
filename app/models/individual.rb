class Individual < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  belongs_to :meeting
  has_many :group_assignments
  has_many :groups, through: :group_assignments
end
