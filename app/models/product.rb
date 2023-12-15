class Product < ApplicationRecord
    belongs_to :cataloge
    has_many :cards

    validates :title, presence: true, length: { maximum: 100 }
    validates :price, presence: true
end
