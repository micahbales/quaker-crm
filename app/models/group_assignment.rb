class GroupAssignment < ApplicationRecord
  validates :group_id, presence: true
  validates :individual_id, presence: true

  belongs_to :group
  belongs_to :individual
end
