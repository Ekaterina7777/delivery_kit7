class Product < ApplicationRecord
    belongs_to :cataloge

    validates :title, presence: true, length: { maximum: 100 }
    validates :price, presence: true
end
