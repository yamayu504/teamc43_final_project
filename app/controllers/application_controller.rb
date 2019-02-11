class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # 環境がproductionかどうかの判定を行なっている。
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      username == 'admin' && password == '2222'
    end
  end

  def configure_permitted_parameters
    added_attrs = [:nickname, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :last_name_kana, :first_name_kana, :phone_number, :postal_code, :prefecture, :cities, :address, :building_name, :birthday, :icon_image, :profile]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
