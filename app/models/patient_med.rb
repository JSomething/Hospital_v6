class PatientMed < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication
end
