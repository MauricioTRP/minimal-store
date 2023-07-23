require 'rails_helper'

RSpec.describe '/products', type: :request do
  before { sign_in create(:user) }

  # =============== Context describing ==============

  let(:valid_attributes) {
    attributes_for(:product)
  }

  let(:invalid_attributes) {
    {
      title: '',
      description:'',
      price: 10.05
    }
  }


  # ============ Tests ============================

  describe 'GET /index' do
    it 'renders a successful response' do
      create(:product)
      get products_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      product = create(:product)
      get product_url(product)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_product_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      product = create(:product)
      get edit_product_url(product)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Product' do
        expect {
          post products_url, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)
      end

      it 'redirects to the created product' do
        post products_url, params: { product: valid_attributes }
        expect(response).to redirect_to(product_url(Product.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Product' do
        expect {
          post products_url, params: { product: invalid_attributes }
        }.to change(Product, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post products_url, params: { product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        {
          title: 'Ahora es un elefante',
          description: 'Un muy gran elefante',
          price: 1000
        }
      }

      it 'updates the requested product' do
        product = create(:product)
        patch product_url(product), params: { product: new_attributes }
        product.reload
      end

      it 'redirects to the product' do
        product = create(:product)
        patch product_url(product), params: { product: new_attributes }
        product.reload
        expect(response).to redirect_to(product_url(product))
      end
    end

    context 'with invalid parameters' do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        product = create(:product)
        patch product_url(product), params: { product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe 'DELETE /destroy' do
    context 'is a referenced product' do
      it 'cant destroy a product' do
        line_item = LineItem.create(product: create(:product), cart: Cart.create!)
        expect {
          delete product_url(line_item.product)
        }.to change(Product, :count).by(0)
      end
    end

    context 'is a non referenced product' do
      it 'destroys a non referenced product' do
        product = create(:product)
        expect {
          delete product_url(product)
        }.to change(Product, :count).by(-1)
      end
  
      it 'redirects to the products list' do
        product = create(:product)
        delete product_url(product)
        expect(response).to redirect_to(products_url)
      end  
    end
  end
end
