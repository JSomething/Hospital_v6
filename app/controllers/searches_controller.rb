class SearchesController < ApplicationController

  def index
    q = params[:q]
    @doctors = Doctor.search(doctor_name_or_specialty_cont: q).result
    @patients = Patient.search(first_name_or_last_name_or_description_cont: q).result
    @nurses = Nurse.search(nurseable_of_Doctor_type_nurse_name_cont: q).result
    @medications = Medication.search(name_or_company_or_adverse_effects_cont: q).result
  end
end
