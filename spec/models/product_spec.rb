require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @product1 = create(:product)
  end

  it 'is valid with attributes' do
    expect(@product1).to be_valid
  end

  it 'is invalid without Title' do
    product2 = build(:product)
    product2.title = nil

    expect(product2).to_not be_valid
  end
end
