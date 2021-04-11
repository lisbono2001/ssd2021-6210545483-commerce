class Product < ApplicationRecord
    include Visible
    has_many :reviews, dependent: :destroy

    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 20 }
end
