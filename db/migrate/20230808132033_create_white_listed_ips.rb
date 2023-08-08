# frozen_string_literal: true

class CreateWhiteListedIps < ActiveRecord::Migration[7.0]
  def change
    create_table :white_listed_ips do |t|
      t.string     :source_ip
      t.string     :name

      t.timestamps
    end
  end
end
