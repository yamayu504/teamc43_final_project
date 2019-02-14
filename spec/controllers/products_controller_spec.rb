require 'rails_helper'

describe ProductsController, type: :controller do
let(:user) { create(:user)}
let(:category) { create(:category)}
let(:brand) { create(:brand)}
  context 'submit correctly' do
    let(:params) { { product: attributes_for(:product) ,p_image: {:p_images => [attributes_for(:p_images)]}}}
    describe 'POST /products' do
      it "save product and response 200" do
        subject {
          xhr :post, :create, params: params
          response.should be_success
          expect(response.status).to eq 200
        }
      end
      let(:noimage_params) { { product: attributes_for(:product) ,p_image: {:p_images => []} } }
      it "submit no p_images not correct" do
        subject {
          xhr :post, :create, params: noimage_params
        expect(response).to redirect_to( new_product_path )
        }
      end
      let(:noname_params) { { product: attributes_for(:product, name: nil) ,p_image: {:p_images => [attributes_for(:p_images)]}}}
      it "submit no name not correct" do
        subject {
          xhr :post, :create, params: noname_params
          expect(response.status).to eq 422
        }
      end
    end
  end
end



