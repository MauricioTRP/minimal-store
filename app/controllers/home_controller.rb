class HomeController < ApplicationController
  after_action :increment_counter, only: [:index]
  def index
    @products = Product.order(:title)
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
