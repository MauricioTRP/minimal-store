require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  before(:each) do
    assign(:products, [
      create(:product),
      create(:product)
    ])
  end

  it 'renders a navbar' do
    render 'shared/navbar'

    assert_select 'nav', minimum: 1
  end

  it 'renders products' do
    render

    assert_select 'h5', minimum: 2
  end
end
