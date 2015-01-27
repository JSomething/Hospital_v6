class Doctor < ActiveRecord::Base
  has_many :patients, dependent: :destroy
  has_many :nurses, as: :nurseable

  validates :doctor_name, presence: true
  validates :specialty, presence: true
end
