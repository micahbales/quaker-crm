class GroupAssignment < ApplicationRecord
  validates :group_id, presence: true
  validates :individual_id, presence: true

  has_many :groups 
  has_many :individuals
end
