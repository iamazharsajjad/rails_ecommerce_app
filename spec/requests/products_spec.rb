# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET index' do
    it 'assigns @products' do
      product = FactoryBot.create(:product)
      product.images.attach(
        io: File.open(File.join(Rails.root, 'app/assets/images/pic01.jpg')),
        filename: 'pic01.jpg'
      )
      get products_path
      expect(assigns(:products)).to eq([product])
      expect(response).to have_http_status(200)
      # expect(response.body).to include(brand.name)
    end
  end

  describe 'GET show' do
    it 'assigns @products' do
      product = FactoryBot.create(:product)
      get product_path(product.id)
      # expect(assigns(:products)).to eq([product])
      expect(response).to have_http_status(200)
      # expect(response).should redirect_to(product)
      # expect(response).to render_template("index")
    end
  end
end
