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

  def card
  end

  def paycreate
  end

  def pay
    require 'payjp'
    Payjp.api_key = PAYJP_SECRET_KEY
    # トークンを受け取る
    token_id = params[:payjpToken]
    # payjpに顧客登録して顧客IDをもらう
    customer = Payjp::Customer.create(card: token_id)
    # ログイン中ユーザーのレコード獲得
    customer_id = customer.id
    user = User.find(current_user.id)
  #ログインユーザーのcustmer_idカラムにtokenを入れて更新する、そして結果をresultに代入
    result = user.update(customer_id: customer.id)
    #updateが成功したかどうかで場合分け
    if result == true
      flash[:notice] = "クレジットカードの登録が成功しました"
      redirect_to action: :card
    else
      flash[:notice] = "クレジットカードの登録に失敗しました"
      redirect_to action: :card
    end
  end
end
