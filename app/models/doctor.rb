class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :hospital
  belongs_to :specialization
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
end
