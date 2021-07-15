# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :buyer, class_name: 'User'
  belongs_to :product
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
end
