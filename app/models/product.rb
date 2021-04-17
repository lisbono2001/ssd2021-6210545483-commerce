class Product < ApplicationRecord
    include Visible
    has_many :reviews, dependent: :destroy

    has_many :categories_products
    has_many :categories, through: :categories_products

    has_one_attached :image

    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 20 }
end
