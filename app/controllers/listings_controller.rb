class ListingsController < ApplicationController
  def index
    @products = current_user.sell_products.where(buyer_id: nil,deal: 0)
  end
end
