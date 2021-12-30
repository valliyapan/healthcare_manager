class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :hospital
  belongs_to :specialization
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  def first_five
    appointments.where(status: false).take(5)
  end

  def unseen
    appointments.where(status: false)
  end

  def seen
    appointments.where(status: true)
  end

  def self.day(t)
    Date.today.next_day(t).strftime("%a %d %b").to_s
  end

  def available?(i,day_name)
    if day_name.include?(i+1)
      true
    else
      false
    end
  end

  
  def booked(day,slot)
    appointments.where(status:  false).each do |appointment|
      diff = ((appointment.appointment_time - DateTime.now)/(24*3600)).floor
      if diff == day && appointment.appointment_time.strftime("%H").to_i - 8 == slot+1
        return true
      end
    end
    false
  end
  

  def find_day(t)
    t = (t + Date.today.cwday - 1).modulo(7)
    case t
    when 0
      mon
    when 1
      tue
    when 2
      wed
    when 3
      thu
    when 4
      fri
    when 5
      sat
    when 6
      sun
    end
  end

  def available(t,i)
    day_name = find_day(t)
    available?(i,day_name)
  end

end
