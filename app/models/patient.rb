class Patient < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destoy
  has_many :doctors, through: :appointments
end
