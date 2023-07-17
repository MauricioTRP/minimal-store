require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/line_items", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # LineItem. As you add validations to LineItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:line_item)
  }

  let(:invalid_attributes) {
    {
      product_id: '',
      cart_id: ''
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      LineItem.create! valid_attributes
      get line_items_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      line_item = LineItem.create! valid_attributes
      get line_item_url(line_item)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_line_item_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      line_item = LineItem.create! valid_attributes
      get edit_line_item_url(line_item)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new LineItem" do
        expect {
          post line_items_url, params: { line_item: valid_attributes, product_id: valid_attributes[:product].id }
        }.to change(LineItem, :count).by(1)
      end

      it "redirects to the created line_item" do
        post line_items_url, params: { line_item: valid_attributes, product_id: valid_attributes[:product].id }
        expect(response).to redirect_to(cart_url(LineItem.last.cart))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        attributes_for(:line_item)
      }

      it "updates the requested line_item" do
        line_item = LineItem.create! valid_attributes
        
        patch line_item_url(line_item), params: { line_item: new_attributes }
        line_item.reload
        
        expect(LineItem.create! valid_attributes).to_not eq(line_item)
      end

      it "redirects to the cart" do
        # pending "need to implement redirecting in card update"
        line_item = LineItem.create! valid_attributes
        patch line_item_url(line_item), params: { line_item: new_attributes }
        line_item.reload
        expect(response).to redirect_to(cart_url(line_item.cart))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        line_item = LineItem.create! valid_attributes
        patch line_item_url(line_item), params: { line_item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested line_item" do
      line_item = LineItem.create! valid_attributes
      expect {
        delete line_item_url(line_item)
      }.to change(LineItem, :count).by(-1)
    end

    it "redirects to the line_items list" do
      line_item = LineItem.create! valid_attributes
      delete line_item_url(line_item)
      expect(response).to redirect_to(line_items_url)
    end
  end
end
