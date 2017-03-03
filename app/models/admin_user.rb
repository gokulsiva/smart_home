class AdminUser < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true, :length => {:maximum => 25}
  validates :last_name,  presence: true, :length => {:maximum => 25}
  validates :username, :presence => true, :length => {:within => 8..25}, :uniqueness => true
  validates :email, presence: true, :length => {:maximum => 50}, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  def name
    "#{first_name} #{last_name}"
  end
end
