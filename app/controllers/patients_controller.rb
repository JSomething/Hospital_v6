class PatientsController < ApplicationController

  def show
    @doctor = Doctor.find params[:doctor_id]
    @patient = Patient.find params[:id]
    @nurse = Nurse.new
    @medication = @patient.medications
    @nurses = @patient.nurses
  end

  def new
    @doctor = Doctor.find params[:doctor_id]
    @patient = @doctor.patients.new
    @medications = Medication.all
  end

  def create
    @doctor = Doctor.find params[:doctor_id]
    @patient = @doctor.patients.create patient_params
    @medications = Medication.all
    if @patient.save
      flash[:success] = "Welcome to St. Jon's!"
      redirect_to doctor_path(@doctor)
    else
      flash[:danger] = "Form incomplete"
      render :new
    end
  end

  def index
    @patients = Patient.all
  end

  def edit
    @patient = Patient.find params[:id]
    @medications = @patient.medications
    @doctor = Doctor.find params[:doctor_id]
  end

  def update
    @doctor = Doctor.find params[:doctor_id]
    @patient = Patient.find params[:id]
    @patient.update_attributes patient_params
    redirect_to doctors_path(@doctor)
  end

  def destroy
    @doctor = Doctor.find params[:doctor_id]
    @patient = Patient.find params[:id]
    @patient.delete
    redirect_to doctors_path(@doctor)
  end

  def create_nurse
    @doctor = Doctor.find params[:doctor_id]
    @patient = Patient.find params[:id]
    @nurse = @patient.nurses.create nurse_params
    redirect_to doctor_patient_path(@doctor, @patient)
  end

  def destroy_nurse
    @doctor = Doctor.find params[:doctor_id]
    @nurse = Nurse.find params[:id]
    @nurse.delete
    redirect_to doctor_patient_path(@nurse.nurseable.doctor, @nurse.nurseable)
  end

  private

  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :dob,
      :description,
      :gender,
      :blood_type,
      medication_ids: []
    )
  end

  def nurse_params
    params.require(:nurse).permit(
      :nurse_name,
      )
  end
end
