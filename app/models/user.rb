class User < ApplicationRecord
  validates_presence_of :username, :first_name, :last_name, :phone, :address, :city, :state, :zip
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, :on => :create

  has_secure_password

  enum role: %w(user admin)

  has_many :reservations

  def full_name
    "#{first_name} #{last_name}"
  end
end
