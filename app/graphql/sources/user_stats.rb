# frozen_string_literal: true

module Sources
  class UserStats < GraphQL::Dataloader::Source
    def initialize(user)
      @user = user
    end

    def fetch(_)
      [
        {
          bought_from: bought_from,
          sold_to: sold_to
        }
      ]
    end

    private

    def bought_from
      User
        .select('DISTINCT purchases.seller_id')
        .joins('LEFT JOIN purchases ON purchases.seller_id = users.id')
        .where(purchases: { buyer_id: @user.id }).count
    end

    def sold_to
      User
        .select('DISTINCT purchases.buyer_id')
        .joins('LEFT JOIN purchases ON purchases.buyer_id = users.id')
        .where(purchases: { seller_id: @user.id }).count
    end
  end
end
