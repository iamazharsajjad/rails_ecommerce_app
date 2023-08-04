# frozen_string_literal: true

class ProductJob
  include Sidekiq::Job

  def perform(*_args)
    puts 'hello world'
  end
end
