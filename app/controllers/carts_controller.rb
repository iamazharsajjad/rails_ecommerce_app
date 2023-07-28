# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @render_cart = false
  end

  def add
    @product = Product.find(params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity.positive?
      current_orderable.update(quantity)
    elsif quantity <= 0

      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity: quantity)
    end
    update_turbo_stream
  end

  def remove
    orderable = Orderable.find(params[:id])
    orderable.destroy
    update_turbo_stream
  end

  private

    def update_turbo_stream
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [turbo_stream.replace('cart', partial: 'carts/cart')]
          # ,turbo_stream.replace('@product')
        end
      end
    end
end
