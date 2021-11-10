class User < ApplicationRecord
  has_one :patient, dependent: :destroy
  has_one :clerk, dependent: :destroy
  has_one :doctor, dependent: :destroy
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :gender, presence: true
  validates :password, length: { in: 6..20 }
  validates_uniqueness_of :email
end
