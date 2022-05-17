class Zone < ApplicationRecord
  belongs_to :section
  has_many :items, dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true
  validates :description, presence: true
end
