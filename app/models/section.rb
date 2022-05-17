class Section < ApplicationRecord
  belongs_to :warehouse
  has_many :zones, dependent: :destroy
  has_many :items, through: :zones

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
end
