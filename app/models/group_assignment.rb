class GroupAssignment < ApplicationRecord
  validates :group_id, presence: true, uniqueness: true
  validates :individual_id, presence: true, uniqueness: true

  belongs_to :group
  belongs_to :individual
end
