class AdminController < ApplicationController
    def users
        @users = User.all
    end

    def products
        @products = Product.all
    end
end
