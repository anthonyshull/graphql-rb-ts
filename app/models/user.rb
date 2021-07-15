# frozen_string_literal: true

class User < ApplicationRecord
  has_many :purchases, foreign_key: 'buyer_id'

  rolify

  scope :sorted_by_created_at, lambda { |direction|
    order(created_at: direction)
  }
end
