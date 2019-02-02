class ProductsController < ApplicationController
  def index
  end
  def new
    @product = Product.new
    @choices = {"---": 0, "レディース": 1,"メンズ":2}
  end
end
