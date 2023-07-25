# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :phone,      presence: true
  validates :address, length: { maximum: 500 }
end
