class PImagesController < ApplicationController

  def destroy
    p_image = PImage.find(params[:id])
    product_seller = p_image.product.seller_id
    p_image.destroy if product_seller == current_user.id
    respond_to do |format|
      format.json
    end
  end
end
