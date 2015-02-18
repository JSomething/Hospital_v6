namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'

    [Doctor, Patient].each(&:delete_all)

    Doctor.populate 20 do |doctor|
      doctor.doctor_name = Faker::Name.name
      doctor.specialty = Faker::Hacker.ingverb
      Patient.populate 5..10 do |patient|
        patient.doctor_id = doctor.id
        patient.first_name = Faker::Name.first_name
        patient.last_name = Faker::Name.last_name
        patient.dob = 80.years.ago..10.years.ago
        patient.description = Faker::Lorem.sentence(3, true, 4)
        patient.gender = ["male", "female"]
        patient.blood_type = [
          "A",
          "A-",
          "A+",
          "B",
          "B-",
          "B+",
          "O",
          "O-",
          "O+"
        ]
        patient.workflow_state = "waiting_room"
      end
    end
  end
end
      