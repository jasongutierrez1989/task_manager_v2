class User < ApplicationRecord
  has_many :tasks
  has_many :locations, through: :tasks
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
