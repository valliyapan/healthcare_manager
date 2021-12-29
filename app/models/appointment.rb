class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :hospital

  def margin
    (self.appointment_time-DateTime.now)/3600>=7.30
  end

  def self.check(i,t)
    curr_hour = DateTime.now.strftime("%H").to_i
    ((t==0 && curr_hour > i+9) || (t>3))
  end
end
