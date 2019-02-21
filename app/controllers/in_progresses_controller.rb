class InProgressesController < ApplicationController
  def index
    if user_signed_in?
      @products = current_user.sell_products.where.not(buyer_id: nil, deal:1)
    else
      redirect_to new_user_session_path
    end
  end
end
