class UsersController < ApplicationController
  def index
  end
  def create
  end
  def update
    # @product = Product.
  end
  def show
    @user = User.find(params[:id])
  end
  def logout
  end
end
