class PurchasedsController < ApplicationController
  def index
    @products = current_user.buy_products.where(deal: 1)
  end
end
