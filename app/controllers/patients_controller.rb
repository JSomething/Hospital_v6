class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create patient_params
    if @patient.save
      flash[:success] = "Welcome to St. Jon's!"
      redirect_to patients_path
    else
      flash[:danger] = "Form incomplete"
      render :new
    end
  end

  def index
    @patients = Patient.all
  end

  private

  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :dob,
      :description,
      :gender,
      :blood_type
    )
  end
end
