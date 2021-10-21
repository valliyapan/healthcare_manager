class Hospital < ApplicationRecord
  has_one :clerk
  has_many :doctors
  has_many :specializations, through: :doctors
  has_many :appointments
end
