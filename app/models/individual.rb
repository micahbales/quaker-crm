class Individual < ApplicationRecord
  include PgSearch
  multisearchable against: [:first_name, :last_name, :address, :email, :phone, :birthday, :notes]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :meeting, presence: true

  belongs_to :meeting
  has_many :group_assignments, dependent: :destroy
  has_many :groups, through: :group_assignments
end
