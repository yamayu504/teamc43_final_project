class ListingsController < ApplicationController
  def index
    @products = current_user.sell_products.where(buyer_id: nil,deal: 0)
  end
  def show
    @product = Product.find(params[:id])
    @images  = @product.p_images
  end
  def update
    @product = Product.find(params[:id])
    if @product.seller_id == current_user.id
      if @product.for_sale == 1
        @product.for_sale = 0
        @images  = @product.p_images
        render :show
      elsif @product.for_sale == 0
        @product.for_sale = 1
        @images  = @product.p_images
        render :show
      end
    else
      redirect_to new_user_session_path
    end
  end
end
