class AddDoctorIdToPaitents < ActiveRecord::Migration
  def change
    add_column :patients, :doctor_id, :integer
    add_column :medications, :patient_id, :integer
  end
end
