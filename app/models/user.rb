class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :locations, through: :tasks
  validates_presence_of :name
  validates :email, presence: true, uniqueness: true
  has_secure_password

  scope :admin?, -> { where(admin: true)}
end
