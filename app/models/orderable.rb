# frozen_string_literal: true

class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total
    product.price * quantity
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[cart_id created_at id product_id quantity updated_at]
  end
end
