# frozen_string_literal: true

module Types
  class UserStatsType < Types::BaseObject
    field :bought_from, Integer, null: false
    field :sold_to, Integer, null: false
  end
end
