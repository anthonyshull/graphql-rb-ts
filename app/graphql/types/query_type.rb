# frozen_string_literal: true

module Types
  # The base QueryType for GraphQL queries
  class QueryType < Types::BaseObject
    field :products,
          Types::ProductType.connection_type,
          null: true,
          description: 'Returns a list of products'

    field :purchase, Types::PurchaseType, null: false do
      description 'Return a purchase by id'
      argument :id, ID, required: true
    end

    field :purchases,
          [Types::PurchaseType],
          null: true,
          description: 'Returns a list of purchases'

    field :user, Types::UserType, null: false do
      description 'Return a user by id'
      argument :id, ID, required: true
    end

    field :users,
          [Types::UserType],
          null: true,
          description: 'Returns a list of users'

    field :users_sorted_by_created_at, [Types::UserType], null: true do
      description 'Returns a list of users sorted by created_at'
      argument :direction, String, required: true
    end

    def products
      Product.all
    end

    def purchase(id:)
      Purchase.find(id)
    end

    def purchases
      Purchase.all
    end

    def user(id:)
      User.find(id)
    end

    def users
      User.all
    end

    def users_sorted_by_created_at(direction:)
      User.sorted_by_created_at(direction)
    end
  end
end
