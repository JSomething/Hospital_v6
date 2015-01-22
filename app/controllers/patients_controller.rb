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

  def edit
    @patient = Patient.find params[:id]
  end

  def update
    @patient = Patient.find params[:id]
    @patient.update_attributes patient_params
    redirect_to patients_path
  end

  def destroy
    @patient = Patient.find params[:id]
    @patient.delete
    redirect_to patients_path
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
