class Patient < ActiveRecord::Base

  belongs_to :doctor
  has_many :patient_medications
  has_many :medications, through: :patient_medications
  has_many :nurses, as: :nurseable

  BLOOD_OPTIONS = [
    "A",
    "A-",
    "A+",
    "B",
    "B-",
    "B+",
    "O",
    "O-",
    "O+"
  ]
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :description, presence: true
  validates :gender, presence: true
  validates :blood_type, presence: true

  include Workflow
  workflow do
    state :waiting_room do
      event :wait, transitions_to: :waiting_room
      event :checkup, transitions_to: :mid_checkup
      event :xray, transitions_to: :mid_xray
      event :enter_surgery, transitions_to: :mid_surgery
      event :pay, transitions_to: :paid
      event :discharge, transitions_to: :discharged
    end

    state :mid_checkup do
      event :xray, transitions_to: :mid_xray
      event :pay, transitions_to: :paid
      event :discharge, transitions_to: :discharged
    end

    state :mid_xray do
      event :pay, transitions_to: :paid
      event :checkup, transitions_to: :mid_checkup
      event :discharge, transitions_to: :discharged
    end

    state :mid_surgery do
      event :pay, transitions_to: :paid
      event :discharge, transitions_to: :discharged
    end

    state :paid do
      event :discharge, transitions_to: :discharged
    end

    state :discharged do
      event :wait, transitions_to: :waiting_room
    end
  end

  #  def self.search(search)
  #   if search
  #     where("first_name LIKE ? OR last_name LIKE?", "%#{search}%", "%#{search}%")
  #   else
  #     scoped
  #   end
  # end
end
