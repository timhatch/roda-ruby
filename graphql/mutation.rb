# frozen_string_literal: true

require 'graphql'

# require_relative 'person_type'

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    field :success, Boolean, null: false
    field :errors, [String], null: false
  end
end

module Mutations
  class EditPerson < Mutations::BaseMutation
    description 'Edits a Person'

    argument :id, Integer, required: true

    def resolve(id:)
      puts "Do something with athlete data #{id}"
      { success: true, errors: [] }
    end
  end
end

    def resolve(id:)
      puts "Do something with results data #{id}"
      { success: true, errors: [] }
    end
  end
end

module Types
  class MutationType < GraphQL::Schema::Object
    description 'Defined data mutations'

    field :editPerson, mutation: Mutations::EditPerson
  end
end
