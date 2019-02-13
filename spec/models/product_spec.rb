require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    it "is valid with all user info" do
      product  = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without name" do
     product   = build(:product, name: "")
     product.valid?
     expect(product.errors[:name]).to include("を入力してください")
    end

    it "is invalid whithout description " do
      product  = build(:product, description:"")
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "is invalid condition 0" do
      product  = build(:product, condition: 0)
      product.valid?
      expect(product.errors[:condition]).to include("は1以上の値にしてください")
    end
    it "is invalid select_shipping_fee 0" do
      product  = build(:product, select_shipping_fee: 0)
      product.valid?
      expect(product.errors[:select_shipping_fee]).to include("は1以上の値にしてください")
    end
    it "is invalid shipping_method 0" do
      product  = build(:product, shipping_method: 0)
      product.valid?
      expect(product.errors[:shipping_method]).to include("は1以上の値にしてください")
    end
    it "is invalid area 0" do
      product  = build(:product, area: 0)
      product.valid?
      expect(product.errors[:area]).to include("は1以上の値にしてください")
    end
    it "is invalid shipping_date 0" do
      product  = build(:product, shipping_date: 0)
      product.valid?
      expect(product.errors[:shipping_date]).to include("は1以上の値にしてください")
    end
    it "is invalid price nil" do
      product  = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end
    it "is invalid seller_id null" do
      product  = build(:product, seller: nil)
      product.valid?
      expect(product.errors[:seller]).to include("を入力してください")
    end
    it "is invalid category_id nil" do
      product  = build(:product, category: nil)
      product.valid?

      expect(product.errors[:category]).to include("を入力してください")
    end
    it "is invalid name more than 40" do
      product  = build(:product, name: "a"* 41)
      product.valid?
      expect(product.errors[:name]).to include("は40文字以内で入力してください")
    end
    it "is invalid description more than 1000" do
      product  = build(:product, description: "a"* 1001)
      product.valid?
      expect(product.errors[:description]).to include("は1000文字以内で入力してください")
    end
    it "is invalid price more than 300" do
      product  = build(:product, price:299)
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end
    it "is invalid price less than 10000000" do
      product  = build(:product, price:10000001)
      product.valid?
      expect(product.errors[:price]).to include("は10000000より小さい値にしてください")
    end
  end
end
