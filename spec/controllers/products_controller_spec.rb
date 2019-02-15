require 'rails_helper'

describe ProductsController, type: :controller do
let(:user) { create(:user)}
let(:category) { create(:category)}
let(:brand) { create(:brand)}
  context 'submit correctly #create' do
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
  describe 'GET #index' do
    before do
      get :index
    end
    it "@brands not to empty " do
      expect(assigns(:brands)).not_to be_empty
    end
    it "@categoreis not to empty" do
      expect(assigns(:categories)).not_to be_empty
    end
    it "@brands have correct calum" do
      assigns(:brands).each do |brand|
        expect(brand[:name]).not_to         be_empty
        expect(brand[:group_name]).not_to   be_empty
        expect(brand[:name_initial]).not_to be_empty
      end
    end
    it "@categories have correct calum" do
      assigns(:categories).each do |category|
        expect(category[:name]).not_to         be_empty
      end
    end
    it "renders index " do
      expect(response).to render_template :index
    end
  end
  describe 'GET #show' do
    before do
      get :show, params: { id: 1 }
    end
    it "@product not to empty " do
      expect(assigns(:product).name).to eq "AWS"
    end
    it "@images not to empty" do
      expect(assigns(:images)).not_to be_empty
    end
    it "@similer_category is not empty" do
      expect(assigns(:similer_categories)).not_to be_empty
    end
    it "renders index " do
      expect(response).to render_template :show
    end
  end
end



