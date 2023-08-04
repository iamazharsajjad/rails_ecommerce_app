# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def hello
    ProductJob.perform_at(10.seconds.from_now)
  end
end
