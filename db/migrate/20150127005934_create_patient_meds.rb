class CreatePatientMeds < ActiveRecord::Migration
  def change
    create_table :patient_meds do |t|

      t.timestamps null: false
    end
  end
end
