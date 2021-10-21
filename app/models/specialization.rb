class Specialization < ApplicationRecord
  has_many: doctors
  has_many: hospitals, through: :doctors
end
