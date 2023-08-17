# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables

  def total
    orderables.to_a.sum(&:total)
  end
end
