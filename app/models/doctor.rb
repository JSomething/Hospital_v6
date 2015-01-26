class Doctor < ActiveRecord::Base
  has_many :patients, dependent: :destroy

  validates :doctor_name, presence: true
  validates :specialty, presence: true
end
