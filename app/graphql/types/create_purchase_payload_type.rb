# frozen_string_literal: true

module Types
  class CreatePurchasePayloadType < Types::BaseObject
    field :purchase, Types::PurchaseType, null: true
    field :errors, [String], null: true
  end
end
