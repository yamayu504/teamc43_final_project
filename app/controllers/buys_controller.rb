class BuysController < ApplicationController
  before_action :sign_in_confirmation
  def index
    @product = Product.find(params[:product_id])
    unless @product.seller_id == current_user.id
    else
      redirect_to root_path
    end
  end
  def update
    @product = Product.find(params[:product_id])
    if @product.seller_id == current_user.id
      redirect_to root_path, notice: "ご自身が出品した商品は買えません"
    else
      @product.update(deal: 1, buyer_id: current_user.id)
      @product.save
    # pay.jp側に売上として反映させる
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      customer: current_user.customer_id,
      currency: 'jpy',
    )
      redirect_to root_path, notice: "商品を購入しました"
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
