class BuyersController < ApplicationController
    before_action :authenticate_user!

    def index
        @products = Product.all
        @cocktail = Product.where(category_id:"1")
        @whisky = Product.where(category_id:"2")
    end

end