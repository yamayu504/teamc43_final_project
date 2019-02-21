class PurchasesController < ApplicationController
  def index
    if user_signed_in?
      @products = current_user.buy_products.where(deal: 0)
    else
      redirect_to new_user_session_path
    end
  end
end
