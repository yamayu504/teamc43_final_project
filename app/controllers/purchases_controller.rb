class PurchasesController < ApplicationController
    def index
      @products = current_user.buy_products.where(deal: 0)
  end
end
