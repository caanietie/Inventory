class Warehouse < ApplicationRecord
    has_many :sections, dependent: :destroy
    has_many :zones, through: :sections
    has_many :items, through: :zones

    validates :name, presence: true, uniqueness: true
    validates :location, presence: true, uniqueness: true
    validates :description, presence: true, uniqueness: true
end
