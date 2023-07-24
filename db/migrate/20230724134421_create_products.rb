# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :stripe_id
      t.integer :price
      t.integer :sale_price
      t.string :currency

      t.timestamps
    end
  end
end
