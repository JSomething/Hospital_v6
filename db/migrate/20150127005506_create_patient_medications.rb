class CreatePatientMedications < ActiveRecord::Migration
  def change
    create_table :patient_medications do |t|
      t.integer :patient_id
      t.integer :medication_id
    end
  end
end
