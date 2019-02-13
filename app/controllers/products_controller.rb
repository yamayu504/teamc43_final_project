class ProductsController < ApplicationController
  #updateメソッド時も利用？
  before_action :image_confirmation, only: [:create]
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
      @product = Product.create!(create_params.merge(for_sale:1, deal: 0))
      image_params[:p_images].each do |image|
        @product.p_images.build
        @product.p_images.create(image: image)
      end
      respond_to do |format|
        format.json
      end
  end
  def search
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%").limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def create_params
      product_params = params.require(:product).permit(:name, :description,:category_id, :size, :brand_id, :condition, :select_shipping_fee, :shipping_method, :area, :shipping_date, :price).merge(seller_id: 1)
      # 新規作成画面がないためseller_idは仮置き
      return product_params
  end
  def image_params
    params.require(:p_image).permit({:p_images => []})
  end
  def image_confirmation
    if params[:p_image].present?
    else
      redirect_to new_product_path, alert: '入力に不備があります。必須項目を入力してください。'
    end
  end
end
