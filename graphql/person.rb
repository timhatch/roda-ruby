
require 'sequel'
require 'pg'

# Base module declaration, instantiates a connection to a Postgresql database
#
# Instantiate database access
@db = Sequel.connect('postgres://timhatch@localhost:5432/andromeda')

@db.extension    :pg_array, :pg_json # Needed to insert arrays

Sequel.extension :pg_array_ops # Needed to query stored arrays
Sequel.extension :pg_json_ops # Needed to query stored arrays

module DataModels
  class Person < Sequel::Model(:persons)
    # Note that a one-many association uses the plural model name
    one_to_many :results, key: :per_id
  end
end
