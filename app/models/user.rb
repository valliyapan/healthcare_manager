class User < ApplicationRecord
  has_many :patients, dependent: :destroy
  has_many :clerks, dependent: :destroy
  has_many :doctors, dependent: :destroy
  has_secure_password
end
