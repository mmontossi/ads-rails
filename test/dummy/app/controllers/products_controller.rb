class ProductsController < ApplicationController

  attr_accessor :current_user

  def show
    @current_user = User.new
    @product = Product.new
  end

end
