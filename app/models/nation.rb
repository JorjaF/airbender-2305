class Nation < ApplicationRecord
  has_many :members

  validates :name, presence: true
end
