# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  currency    :string
#  description :string
#  price       :integer
#  sale_price  :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  stripe_id   :string
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'must have an email' do
    product = FactoryBot.create(:product)
    expect(product.currency).to eq('$')
  end

  # describe 'columns' do
  #   it { is_expected.to have_db_column(:title).of_type(:string) }
  #   it { is_expected.to have_db_column(:description).of_type(:string) }
  #   it { is_expected.to have_db_column(:stripe_id).of_type(:string) }
  #   it { is_expected.to have_db_column(:currency).of_type(:string) }
  #   it { is_expected.to have_db_column(:price).of_type(:integer) }
  #   it { is_expected.to have_db_column(:sale_price).of_type(:integer) }
  # end
end
