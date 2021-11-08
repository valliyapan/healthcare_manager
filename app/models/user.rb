class User < ApplicationRecord
  validates :name ,presence: true
  validates :email, presence: true
  validates :name, length: { minimum: 2 }
  has_secure_password
  has_one :patient, dependent: :destroy
  has_one :clerk, dependent: :destroy
  has_one :doctor, dependent: :destroy

  def to_pleasant_string
    "#{id}) #{name} #{email} #{role} #{gender}"
  end

end
