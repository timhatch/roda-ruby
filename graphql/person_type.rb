# frozen_string_literal: true

require 'graphql'

module Types
  class Athlete < GraphQL::Types::Relay::BaseObject
    description 'Maps onto Sequel::Model::Person'

    field :per_id, Integer, null: true, camelize: false
    field :lastname, String, null: false
    field :firstname, String, null: false
    field :federation, String, null: true
    field :nation, String, null: false
    field :birthyear, Integer, null: true
    field :gender, String, null: false
  end
end
