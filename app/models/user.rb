class User < ApplicationRecord
  validates_presence_of :username, :first_name, :last_name, :address, :city, :state, :zip
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password
  enum role: %w(user admin)

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_user_information(info)
    update_attribute(:username, info[:username])
    update_attribute(:first_name, info[:first_name])
    update_attribute(:last_name, info[:last_name])
    update_attribute(:address, info[:address])
    update_attribute(:city, info[:city])
    update_attribute(:state, info[:state])
    update_attribute(:zip, info[:zip])
  end
end
