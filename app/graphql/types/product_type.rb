# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :brand, String, null: true
    field :name, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def self.authorized?(object, context)
      context[:current_user].has_role?(:admin, object)
    end

    def self.scope_items(items, context)
      items.select { |item| authorized?(item, context) }
    end
  end
end
