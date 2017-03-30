class StaticPagesController < ApplicationController
  def index
    @products = Product.last(4)
  end

  def landing_page
      
      @products = Product.last(4)

  end
end
