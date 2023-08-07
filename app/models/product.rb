# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :images

  has_many :orderables
  has_many :carts, through: :orderables

  scope :ordered_by_filename, -> { joins(file_attachment: :blob).order('active_storage_blobs.filename ASC') }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at currency description id price sale_price stripe_id title updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[carts images_attachments images_blobs orderables]
  end
end
