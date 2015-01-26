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
end
