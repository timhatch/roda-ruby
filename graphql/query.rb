# frozen_string_literal: true

require 'graphql'

require_relative 'person_type'

module Types
  class QueryType < GraphQL::Schema::Object
    description 'The query root of the schema'

    field :person, Types::Athlete, null: true do
      description 'Return data for a specified athlete'

      argument :id, Integer, required: true
    end

    def person(id:)
      DataModels::Person.where(per_id: id).first.values
    end

  end
end
