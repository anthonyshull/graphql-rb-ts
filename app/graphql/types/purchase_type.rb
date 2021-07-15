# frozen_string_literal: true

module Types
  class PurchaseType < Types::BaseObject
    field :id, ID, null: false
    field :buyer, Types::UserType, null: false
    field :product, Types::ProductType, null: true
    field :seller, Types::UserType, null: false
    field :price, Float, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def self.authorized?(object, context)
      [object.buyer_id, object.seller_id].include?(context[:current_user].id)
    end

    def self.scope_items(items, context)
      items.select { |item| authorized?(item, context) }
    end
  end
end
