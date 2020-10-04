# frozen_string_literal: true

require 'graphql'

require_relative 'query'
require_relative 'mutation'

class AppSchema < GraphQL::Schema
  query    RootQuery
  mutation MutationType
end
