# frozen_string_literal: true

class Role < ApplicationRecord
  belongs_to :resource,
             polymorphic: true,
             optional: true

  has_and_belongs_to_many :users, join_table: :users_roles

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify
end
