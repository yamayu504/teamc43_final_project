
crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", users_path
  parent :root
end
crumb :listings do |user|
  link "出品した商品-出品中",user_listings_path(user)
  parent :users
end
crumb :in_progresses do |user|
  link "出品した商品-取引中",user_in_progresses_path(user)
  parent :users
end
crumb :completeds do |user|
  link "出品した商品-売却済み",user_completeds_path(user)
  parent :users
end
crumb :purchases do |user|
  link "購入した商品-取り引き中", user_purchases_path(user)
  parent :users
end
crumb :purchaseds do |user|
  link "購入した商品-過去の取引",  user_purchaseds_path(user)
  parent :users
end
crumb :logout do
  link "ログアウト",users_logout_path
  parent :users
end
crumb :listings_product do |user,listings|
  link "出品商品",user_listing_path(user_id:user, id:listings)
  parent :users
end
crumb :identification do |user|
  link "本人情報の登録",user_identifications_path(user)
  parent :users
end

crumb :product_show do |product|
  link product.name ,user_identifications_path(product.id)
  parent :users
end

# /users/1/listings/2
# 保留
crumb :profiles do |user|
  link "プロフィール編集画面",user_registration_path(user)
  parent :users
end


