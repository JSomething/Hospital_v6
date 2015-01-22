class Patient < ActiveRecord::Base
  BLOOD_OPTIONS = [
    "A",
    "B",
    "O"
  ]
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :description, presence: true
  validates :gender, presence: true
  validates :blood_type, presence: true
end
