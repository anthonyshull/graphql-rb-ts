# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :purchases, [Types::PurchaseType], null: true, scope: true
    field :stats, Types::UserStatsType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def stats
      binding.pry

      stats, = dataloader.with(Sources::UserStats, @object).load([])

      stats
    end
  end
end
