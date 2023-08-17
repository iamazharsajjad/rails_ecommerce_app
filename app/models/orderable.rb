# frozen_string_literal: true

# == Schema Information
#
# Table name: orderables
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_orderables_on_cart_id     (cart_id)
#  index_orderables_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (product_id => products.id)
#
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
