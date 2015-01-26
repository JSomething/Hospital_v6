class AddDoctorColumns < ActiveRecord::Migration
  def change
    add_column :doctors, :doctor_name, :string
    add_column :doctors, :specialty, :string
  end
end
