class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :hospital

  def to_pleasant_string
    patient=Patient.find(patient_id)
    user=User.find(patient.user_id)
    hospital=Hospital.find(hospital_id)
    doctor=Doctor.find(doctor_id)
    doctor=User.find(doctor.user_id)
    "#{id}) #{user.name} #{user.email} #{hospital.name} #{hospital.location} #{doctor.name} #{appointment_time}"
  end
end
