class Item < ApplicationRecord
  belongs_to :zone

  validates :name, presence: true
  validates :code, presence: true, length: {is: 2}
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :measure, presence: true
  validates :description, presence: true
end
