class MedicationsController < ApplicationController

  def show
    @doctor = Doctor.find params[:doctor_id]
    @patient = Patient.find params[:patient_id]
    @medication = Medication.find params[:id]
  end

  def new
    @doctor = Doctor.find params[:doctor_id]
    @patient = Patient.find params[:patient_id]
    @medication = @patient.medications.new
  end

  def index
    @medications = Medication.all
  end

  def show
    @doctor = Doctor.find params[:doctor_id]
    @patient = Patient.find params[:patient_id]
    @medication = Medication.find params[:id]
  end

  def create
    @doctor = Doctor.find params[:doctor_id]
    @patient = @doctor.patients.find params[:patient_id]
    @medication = @patient.medications.create medication_params
    if @medication.save
      flash:[:success] = "Medication added!"
      redirect_to doctor_patient_path(@doctor, @patient)
    else
      flash:[:danger] = "Incomplete form!"
      render :new
    end
  end

  def edit
    @doctor = Doctor.find params[:doctor_id]
    @patient = @doctor.patients.find params[:patient_id]
    @medication = @patient.medications.find params[:id]
  end

  def update
    @doctor = Doctor.find params[:doctor_id]
    @patient = @doctor.patients.find params[:patient_id]
    @medication = @patient.medications.find params[:id]
    @medication.update medication_params
    redirect_to doctor_patient_path(@doctor, @patient)
  end

  def destroy
    @medication = Medication.find params[:id]
    @doctor = Doctor.find params[:doctor_id]
    @patient = Patient.find params[:patient_id]
    @medication.delete
    redirect_to doctor_patient_path(@doctor, @patient)
  end

private
  def medication_params
    params.require(:medication).permit(
      :name,
      :company,
      :adverse_effects
      )
  end




end
