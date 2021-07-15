# frozen_string_literal: true

module Types
  # Base mutation type
  class MutationType < Types::BaseObject
    field :create_purchase, mutation: Mutations::CreatePurchaseMutation
  end
end
