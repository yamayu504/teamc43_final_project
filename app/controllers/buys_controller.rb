class BuysController < ApplicationController
  before_action :sign_in_confirmation
  def index
    @product = Product.find(params[:product_id])
    if @product.seller_id == current_user.id
    else
      redirect_to root_path
    end
  end
  def update
    @product = Product.find(params[:product_id])
    if @product.seller_id == current_user.id
      redirect_to root_path
    else
      @product.update(deal: 1, buyer_id: current_user.id)
      @product.save
    end
  end

  private
  def sign_in_confirmation
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end
end
