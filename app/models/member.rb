class Member < ApplicationRecord
  belongs_to :nation

  validates :name, presence: true
  validates :photo_url, presence: true
  validates :allies, presence: true
  validates :enemies, presence: true
  validates :affiliations, presence: true

  scope :in_nation, ->(nation_name) { where(nation: Nation.find_by(name: nation_name)) }
end
