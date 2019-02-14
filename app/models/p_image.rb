class PImage < ApplicationRecord

has_one :product_image, dependent: :destroy
has_one :product, through: :product_images
mount_uploader :image, ImageUploader
end
