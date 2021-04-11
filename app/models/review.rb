class Review < ApplicationRecord
  include Visible
  belongs_to :product
end
