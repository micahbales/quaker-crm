class GroupAssignment < ApplicationRecord
  validates :group, presence: true, uniqueness: {scope: :individual}
  validates :individual, presence: true, uniqueness: {scope: :group}

  belongs_to :group
  belongs_to :individual
end
