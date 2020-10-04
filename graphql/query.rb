# frozen_string_literal: true

require 'graphql'

require_relative 'person_type'

class RootQuery < GraphQL::Schema::Object
  description 'The query root of the schema'

  field :person, Types::Athlete, null: true do
    description 'Get a single athletes in the database'

    argument :id, Integer, required: true
  end

  def person(id:)
    Person.where(per_id: id).first.values
  end
end
