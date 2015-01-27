class Medication < ActiveRecord::Base
  has_many :patient_meds
  has_many :patients, through :patient_meds

  validates :name, presence: true
  validates :company, presence: true
  validates :adverse_effects, presence: true
end
