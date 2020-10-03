# Module  Perseus                 - The namespace for application code
# Module  StandardSpeedModus      - IFSCSpeedModus methods

require 'ranker'

require_relative 'fractional_competition'

module Perseus
  module StandardSpeedModus
    VRM = { 'FLS' => 1001.0, 'DNS' => 1002.0 }.freeze

    # win_tree - return a big-endian array representation of a win-loss tree,
    # e.g. [1, 1, 1] = win-win-win with the most significant win first
    # sig { params(hash: Hash, n: Integer).returns(T::Array[Hash]) }
    def self.win_tree(hash, n = 4) # rubocop:disable Naming/UncommunicativeMethodParamName
      arr = Array.new(n, 0) + hash.keys.sort.reverse.map { |k| hash.dig(k, 'r').to_i }
      arr.slice(-n, n)
    end

    # sig { params(hash: Hash).returns(T::Array[Integer]) }
    def self.result_to_float(time)
      case time
      when 'FLL', nil then 1000.to_f
      when 'DNS'      then 1002.to_f
      else time.to_f
      end
    end

    def self.transform(array)
      inc = ->(str, arr) { arr.include?(str) }
      p array
      case array
      when inc.curry.('FLS') then [VRM['FLS']]
      else array.map(&method(:result_to_float)).sort
      end
    end

    def self.handle_result(hash)
      %w[r1 r2].map { |k| hash.dig(k, 'time') }
               .yield_self(&method(:transform))
    end

    module_function

    # rank_pair - given a pair of results for some race, determine which of the pair has wone/lost
    # sig { params(pair: T::Array[Hash]).returns(T::Array[Hash]) }
    # TODO: Method to compare results for 2 persons and determine a winner
    def rank_pair(pair)
      # case - 2 falls
      # case - 1 false start
      # case - 2 compatitors, equal times
      # case - 2 competitors, one with a DNS
    end

    # add_rank - append a base rank value to each result in an array of results
    # sig { params(results: T::Array[Hash]).returns(T::Array[Hash]) }
    def add_rank(results)
      order = ->(h) { to_result_array(h[:result_jsonb]).push(h[:rank_prev_heat]) }

      Ranker.rank(results, asc: false, strategy: FractionalCompetition, by: order)
            .flat_map { |x| x.rankables.map { |r| r.merge(fraction_rank: x.rank) } }
    end

    # to_result_array -
    # sig { params(hash: Hash, n: Integer).returns(T::Array[Integer]) }
    def to_result_array(hash, n = 4) # rubocop:disable Naming/UncommunicativeMethodParamName
      handle_result(hash)
      # min_time(hash)
      # result_tree = hash.keys.reverse.map { |k| hash.dig(k, 'r') }.compact
      #if result_tree.empty?
      #else
      #  win_tree(hash, n)
      #end
    end
  end
end
