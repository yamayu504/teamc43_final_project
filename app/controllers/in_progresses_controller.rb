class InProgressesController < ApplicationController
  def index
    @products = current_user.sell_products.where.not(buyer_id: nil, deal:1)
  end
end
