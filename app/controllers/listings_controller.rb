class ListingsController < ApplicationController
  before_action :seller_confirmation, only: [:show, :update]
  def index
    if user_signed_in?
    @products = current_user.sell_products.where(buyer_id: nil,deal: 0)
    else
      redirect_to new_user_session_path
    end
  end
  def show
      @images  = @product.p_images
  end
  def update
    if @product.for_sale == 1
      @product.update(for_sale: 0)
      @product.save
      @images  = @product.p_images
      render :show
    elsif @product.for_sale == 0
      @product.update(for_sale: 1)
      @product.save
      @images  = @product.p_images
      render :show
    end
  end

  private
  def seller_confirmation
    @product = Product.find(params[:id])
    if @product.seller_id == current_user.id
    else
      redirect_to new_user_session_path
    end
  end
end
