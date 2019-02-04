class ProductsController < ApplicationController
  def index
  end
  def new
    @product = Product.new
    # カテゴリーテーブルできるまでの仮置き
    @choices = {"---": 0, "レディース": 1,"メンズ":2}
  end
  def show
    @product = Product.find(params[:id])
  end
  def create
    redirect_to root_path
  end

end
