class User < ApplicationRecord
  validates_presence_of :username, :first_name, :last_name, :address, :city, :state, :zip
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password

  enum role: %w(user admin)

  def full_name
    "#{first_name} #{last_name}"
  end
end
