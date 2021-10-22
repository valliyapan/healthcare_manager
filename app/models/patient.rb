class Patient < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
end
