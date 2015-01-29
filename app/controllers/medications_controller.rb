class MedicationsController < ApplicationController

  def show
    @doctor = Doctor.find params[:doctor_id]
    @patient = Patient.find params[:patient_id]
    @medication = Medication.find params[:id]
  end

  def new
    @medication = Medication.new
    @patients = Patient.all
  end

  def index
    @medications = Medication.all
  end

  def show
    @medication = Medication.find params[:id]
  end

  def create
    @medication = Medication.create medication_params
    @patients = Patient.all
    if @medication.save
      flash[:success] = "Medication added!"
      redirect_to doctors_path
    else
      flash[:danger] = "Incomplete form!"
      render :new
    end
  end

  def edit
    @doctor = Doctor.find params[:doctor_id]
    @patient = @doctor.patients.find params[:patient_id]
    @medication = Medication.find params[:id]
  end

  def update
    @doctor = Doctor.find params[:doctor_id]
    @patient = @doctor.patients.find params[:patient_id]
    @medication = Medications.find params[:id]
    @medication.update medication_params
    redirect_to patient_path
  end

  def destroy
    @medication = Medication.find params[:id]
    @doctor = Doctor.find params[:doctor_id]
    @patient = Patient.find params[:patient_id]
    @medication.delete
    redirect_to patient_path
  end

private
  def medication_params
    params.require(:medication).permit(
      :name,
      :company,
      :adverse_effects,
      patient_ids: []
      )
  end




end
