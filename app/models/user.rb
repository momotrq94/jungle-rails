class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: { minimum: 3 }, presence: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    lowerEmail = email.downcase
    self.find_by(email: lowerEmail)&.authenticate(password)
  end

end
