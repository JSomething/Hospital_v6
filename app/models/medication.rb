class Medication < ActiveRecord::Base
  has_many :patient_medications
  has_many :patients, through: :patient_medications

  validates :name, presence: true
  validates :company, presence: true
  validates :adverse_effects, presence: true
end
