class CreatePatientMedications < ActiveRecord::Migration
  def change
    create_table :patient_medications do |t|

      t.timestamps null: false
    end
  end
end
