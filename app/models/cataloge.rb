class Cataloge < ApplicationRecord
    has_many :products

    validates :title, presence: true, length: { maximum: 100 }
    
end
