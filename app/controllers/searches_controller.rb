class SearchesController < ApplicationController

  def index
    q = params[:q]
    @doctors = Doctor.search(doctor_name_or_specialty_cont: q).result
    @patients = Patient.search(first_name_or_last_name_cont: q).result
    @nurses = Nurse.search(nurseable_of_Doctor_type_nurse_name_cont: q).result
    @medications = Medication.search(name_or_company_or_adverse_effects_cont: q).result
  end

  # def search
  #   q = params[:q]
  #   @doctors = Doctor.search(name_or_specialty_cont: q).result
  #   @patients = Patient.search(first_name_or_last_name_or_dob_or_description_or_gender_or_blood_type_cont: q).result
  #   @nurses = Nurse.search(nurseable_of_Doctor_type_nurse_name_cont: q).result
  #   @medications = Medication.search(name_or_company_or_adverse_effects_cont: q).result
  #   redirect_to searches_path
  # end

end
