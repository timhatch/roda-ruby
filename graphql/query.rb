# frozen_string_literal: true

require 'graphql'

require_relative 'person_type'

module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
  end
end

module Resolvers
  class Result < Resolvers::BaseResolver
    description 'Return an array of result data'
    type [Types::Result], null: true

    argument :id, Integer, required: true

    def resolve(id:)
      DataModels::Result.all.take(id).map(&:values)
    end
  end
end

module Resolvers
  class Athlete < Resolvers::BaseResolver
    description 'Return data for a specified athlete'
    type Types::Athlete, null: true

    argument :id, Integer, required: true

    def resolve(id:)
      DataModels::Person.where(per_id: id).first.values
    end
  end
end

module Types
  class QueryType < GraphQL::Schema::Object
    description 'The query root of the schema'

    field :person, resolver: Resolvers::Athlete
    field :result, resolver: Resolvers::Result
  end
end
