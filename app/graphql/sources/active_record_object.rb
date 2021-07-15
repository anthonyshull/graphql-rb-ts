# frozen_string_literal: true

module Sources
  # Return ActiveRecord objects based on class and id.
  class ActiveRecordObject < GraphQL::Dataloader::Source
    def initialize(klass)
      super
      @klass = klass
    end

    def fetch(ids)
      thread = Thread.new { @klass.where(ids: ids) }

      dataloader.yield

      thread.value
    end
  end
end
