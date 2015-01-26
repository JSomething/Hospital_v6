class Medication < ActiveRecord::Base
  belongs_to :patient

  validates :name, presence: true
  validates :company, presence: true
  validates :adverse_effects, presence: true
end
