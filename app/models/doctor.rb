class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :hospital
  belongs_to :specialization
  has_many :appointments, dependent: :destoy
  has_many :patients, through: :appointments
end
