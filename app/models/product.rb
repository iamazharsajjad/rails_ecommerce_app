# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :images

  has_many :orderables
  has_many :carts, through: :orderables
end
