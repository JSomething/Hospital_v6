class AddPatientMigrationColumns < ActiveRecord::Migration
  def change
    add_column :patient_medications, :patient_id, :integer
    add_column :patient_medications, :medication_id, :integer
  end
end
