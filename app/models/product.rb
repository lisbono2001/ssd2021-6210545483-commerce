class Product < ApplicationRecord
    include Visible
    has_many :reviews, dependent: :destroy

    has_many :categories_products
    has_many :categories, through: :categories_products

    has_one_attached :image

    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 15 }
    validates :price, presence: true, numericality: {message: "Price must be possitive value!" ,in: 1..9999}
    validates :stock, presence: true, numericality: { only_integer: true ,message: "Stock must be possitive integer!" , in: 1..9999}
end
