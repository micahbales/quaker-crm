class Group < ApplicationRecord
  include PgSearch
  multisearchable against: [:name, :description]

  validates :name, presence: true
  validates :meeting, presence: true

  belongs_to :meeting
  has_many :group_assignments, dependent: :destroy
  has_many :individuals, through: :group_assignments
end
