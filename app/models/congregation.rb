class Congregation < ApplicatioRecord
  validates :name, presence: true

  belongs_to :user
end
