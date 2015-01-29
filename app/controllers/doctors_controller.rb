class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def show
    @doctor = Doctor.find params[:id]
    @patients = @doctor.patients
    @nurse = Nurse.new
    @nurses = @doctor.nurses
  end

  def create
    @doctor = Doctor.create doctor_params
    if @doctor.save
      flash[:success] = "Doctor Created!"
      redirect_to doctors_path
    else
      flash[:danger] = "Form incomplete"
      render :new
    end
  end

  def create_nurse
    @doctor = Doctor.find params[:id]
    @nurse = @doctor.nurses.create nurse_params
    redirect_to doctor_path(@doctor)
  end

  def destroy_nurse
    # @doctor = Doctor.find params[:id]
    # @nurses = @doctor.nurses
    @nurse = Nurse.find params[:id]
    # @nurse = @doctor.nurses.find params[:id]
    @nurse.delete
    redirect_to @nurse.nurseable
  end

  def edit
    @doctor = Doctor.find params[:id]
  end

  def update
    @doctor = Doctor.find params[:id]
    @doctor.update doctor_params
    redirect_to doctors_path
  end

  def destroy
    @doctor = Doctor.find params[:id]
    @doctor.destroy
    redirect_to doctors_path
  end


  private

  def doctor_params
    params.require(:doctor).permit(
      :doctor_name,
      :specialty
      )
  end

  def nurse_params
    params.require(:nurse).permit(
      :nurse_name
      )
  end

end
