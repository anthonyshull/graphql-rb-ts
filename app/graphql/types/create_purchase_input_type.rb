# frozen_string_literal: true

module Types
  class CreatePurchaseInputType < Types::BaseInputObject
    description 'Create a purchase'

    argument :buyer_id, ID, required: true
    argument :seller_id, ID, required: true
    argument :product_id, ID, required: true
    argument :price, Float, required: true
  end
end
