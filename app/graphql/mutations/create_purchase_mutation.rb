# frozen_string_literal: true

module Mutations
  # Create a Purchase
  class CreatePurchaseMutation < BaseMutation
    input_object_class Types::CreatePurchaseInputType
    object_class Types::CreatePurchasePayloadType

    def resolve(input)
      purchase = Purchase.new(input)

      if purchase.save
        { purchase: purchase, errors: [] }
      else
        { purchase: nil, errors: purchase.errors.full_messages }
      end
    end
  end
end
