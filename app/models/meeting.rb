class Meeting < ApplicationRecord
  include PgSearch
  multisearchable against: [:name, :address, :phone, :website, :affiliation]

  validates :name, presence: true
  validates :user_id, presence: true

  has_many :individuals
  has_many :groups
  belongs_to :user
end
