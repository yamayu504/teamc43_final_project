
class ProductsController < ApplicationController
  #updateメソッド時も利用？
  before_action :image_confirmation, only: [:create]
  before_action :set_product, only:[:show,:update, :edit, :destroy]
  before_action :sign_in_confirmation, only:[:new]
  def index
    brand_ids    = Product.group(:brand_id).order('count_brand_id DESC').where.not(brand_id: nil).limit(2).count(:brand_id).keys
    category_ids = Product.group(:category_id).order('count_category_id DESC').limit(2).count(:category_id).keys
    @brands      = brand_ids.map { |id| Brand.find(id) }
    @categories  = category_ids.map { |id| Category.find(id) }
  end
  def new
      @product = Product.new
      # カテゴリーテーブルできるまでの仮置き
      @choices = {"---": 0, "レディース": 1,"メンズ":2}
  end
  def show
    @images  = @product.p_images
    @similer_categories  = Product.where(category_id: @product.category_id).order('id ASC').limit(6)
    @user_products =Product.where(seller_id: @product.seller_id).limit(6)
  end
  def create
    @product = Product.new(create_params.merge(for_sale:1, deal: 0))
    if @product.save
      image_params[:p_images].each do |image|
        @product.p_images.build
        product_image = @product.p_images.new(image: image)
        product_image.save
      end
      respond_to do |format|
        format.json
      end
    end
  end
  def update
    if @product.seller.id == current_user.id
      if params[:p_image].present?
        if @product.update(create_params.merge(for_sale:1, deal: 0))
          image_params[:p_images].each do |image|
            @product.p_images.build
            product_image = @product.p_images.new(image: image)
            product_image.save
          end
          respond_to do |format|
            format.json
          end
        end
      else
        @product.update(create_params.merge(for_sale:1, deal: 0))
        respond_to do |format|
          format.json
        end
      end
    else
    redirect_to new_user_session_path
    end
  end
  def search
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%").limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end
  def edit
    # カテゴリー機能作成まで借りで全て参照可能
    @categories = Category.all
    @sizes      = Size.all
    @brands     = Brand.all
  end
  def destroy
    @product.destroy if @product.seller.id == current_user.id
    redirect_to user_listings_path(current_user), notice: "商品が削除されました。"
  end

  private
  def create_params
      product_params = params.require(:product).permit(:name, :description,:category_id, :size, :brand_id, :condition, :select_shipping_fee, :shipping_method, :area, :shipping_date, :price).merge(seller_id: current_user.id)
      # 新規作成画面がないためseller_idは仮置き
      product_params[:brand_id] = Brand.find_by(name: product_params[:brand_id]).id if product_params[:brand_id].present?
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
  def set_product
    @product    = Product.find(params[:id])
  end
  def sign_in_confirmation
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end
    def update_confirmation
    if @product.p_images.present?
    else
      redirect_to edit_product_path(@product.id), alert:"画像が登録されいません。"
    end
  end
end
