# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe "GET index" do
    it "assigns @products" do
      product = Product.create({ title: 'Product 1', description: 'Product 1 Description', price: 10, currency: '$' })
      get products_path
      expect(assigns(:products)).to eq([product])
      expect(response).to have_http_status(200)
      # expect(response.body).to include(brand.name)
    end
  end

  describe "GET show" do
    it "assigns @products" do
      product = Product.create({ title: 'Product 1', description: 'Product 1 Description', price: 10, currency: '$' })
      get product_path(product.id)
      # expect(assigns(:products)).to eq([product])
      expect(response).to have_http_status(200)
      # expect(response.body).to include(brand.name)
    end
  end

end