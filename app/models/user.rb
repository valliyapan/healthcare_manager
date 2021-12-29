class User < ApplicationRecord
  has_one :patient, dependent: :destroy
  has_one :clerk, dependent: :destroy
  has_one :doctor, dependent: :destroy
  has_secure_password
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true
  validates :gender, presence: true
  validates :password, length: { in: 6..20 }
  validates_uniqueness_of :email
  before_create :confirmation_token

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  def total
    self.patient.appointments.count
  end

  def unseen
    self.patient.appointments.where(status: false).count
  end

  def seen
    self.patient.appointments.where(status: true).count
  end
  
  private

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  
end
