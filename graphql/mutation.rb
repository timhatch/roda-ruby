# frozen_string_literal: true

require 'graphql'

# require_relative 'person_type'

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
  end
end

module Mutations
  class EditPerson < Mutations::BaseMutation
    description 'Edits a Person'

    argument :id, Integer, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      puts id
      puts 'Do something with data'
      { success: true, errors: [] }
    end
  end
end

class MutationType < GraphQL::Schema::Object
  description 'Update data'

  field :editPerson, mutation: Mutations::EditPerson
end
