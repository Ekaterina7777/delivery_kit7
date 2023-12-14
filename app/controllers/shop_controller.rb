class ShopController < ApplicationController
  def index
  @products = Product.includes(:cataloge).all
  end
end
