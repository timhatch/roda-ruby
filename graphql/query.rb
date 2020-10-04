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

    field :result, [Types::Result], null: true do
      description 'Return an array of result data'

      argument :id, Integer, required: true
    end

    def person(id:)
      DataModels::Person.where(per_id: id).first.values
    end

    def result(id:)
      # p  DataModels::Result.first.values
      DataModels::Result.all.take(id).map(&:values)
    end
  end
end
