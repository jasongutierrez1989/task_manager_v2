class Task < ApplicationRecord
  belongs_to :users
  belongs_to :location
end
