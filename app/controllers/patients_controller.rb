class PatientsController < ApplicationController
  before_action :set_patient, only: [
    :wait_patient,
    :checkup_patient,
    :xray_patient,
    :surgery_patient,
    :bill_patient,
    :discharge_patient
  ]

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
    @doctor = Doctor.find params[:doctor_id]
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

  def wait_patient
    @doctor = Doctor.find params[:doctor_id]
    @patient.wait!
    respond_to do |format|
      format.js
      format.html
    end
  end

  def checkup_patient
    @doctor = Doctor.find params[:doctor_id]
    @patient.checkup!
    respond_to do |format|
      format.js
      format.html
    end
  end

  def xray_patient
    @doctor = Doctor.find params[:doctor_id]
    @patient.xray!
    respond_to do |format|
      format.js
      format.html
    end
  end

  def surgery_patient
    @doctor = Doctor.find params[:doctor_id]
    @patient.enter_surgery!
    respond_to do |format|
      format.js
      format.html
    end
  end

  def bill_patient
    @doctor = Doctor.find params[:doctor_id]
    @patient.pay!
    respond_to do |format|
      format.js
      format.html
    end
  end

  def discharge_patient
    @doctor = Doctor.find params[:doctor_id]
    @patient.discharge!
    respond_to do |format|
      format.js
      format.html
    end
  end

  def patient_search
    @doctor = Doctor.find params[:doctor_id]
    @patients = Patient.where("first_name LIKE ? OR last_name LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def set_patient
    @patient = Patient.find params[:id]
  end

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
