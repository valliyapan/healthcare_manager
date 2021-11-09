class User < ApplicationRecord
  has_one :patient, dependent: :destroy
  has_one :clerk, dependent: :destroy
  has_one :doctor, dependent: :destroy
  has_secure_password
end
