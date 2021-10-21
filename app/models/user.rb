class User < ApplicationRecord
  has_many :patients, dependent: :destoy
  has_many :clerks, dependent: :destoy
  has_many :doctors, dependent: :destoy
end
