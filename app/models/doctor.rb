class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :hospital
  belongs_to :specialization
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  def first_five
    appointments.where(status: false).take(5)
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
