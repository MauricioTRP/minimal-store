class HomeController < ApplicationController
  include CurrentCart
  before_action :set_cart

  after_action :increment_counter, only: [:index]
  def index
    @products = Product.order(:title)
    if @cart.id == session[:cart_id]
      @cart
    else
      invalid_cart
    end
  end

  protected

  def increment_counter
    if session[:counter].nil?
      session[:counter] = 0
    end

    session[:counter] += 1
    @counter = session[:counter]
  end
end
