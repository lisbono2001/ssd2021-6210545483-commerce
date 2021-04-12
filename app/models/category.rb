class Category < ApplicationRecord
    # before_action :authenticate_admin!, except: [:index, :show]

    has_many :categories_products
    has_many :products, through: :categories_products

end
