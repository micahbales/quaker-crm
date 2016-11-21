class GroupAssignment < ApplicationRecord
  validates :group_id, presence: true, uniqueness: {scope: :individual_id}
  validates :individual_id, presence: true, uniqueness: {scope: :group_id}

  belongs_to :group
  belongs_to :individual
end
