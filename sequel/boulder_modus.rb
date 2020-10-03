# Module  Perseus                 - The namespace for application code
# Module  StandardBoulderModus    - IFSCBoulderModus methods

require 'matrix'
require 'ranker'

module Perseus
  module StandardBoulderModus
    # private_class_method

    # ifsc1999 - ranking model prior to the 2018 sseason (T/TA/Z/ZA)
    # sig ( returns(Proc.params(h: Hash).returns(T::Array[Integer])) }
    def self.ifsc1999
      ->(h) { [h[:result][0], -h[:result][1], h[:result][2], -h[:result][3]] }
    end

    # ifsc2018 - ranking model for the 2018 sseason onward (T/Z/TA/ZA)
    # sig ( returns(Proc.params(h: Hash).returns(T::Array[Integer])) }
    def self.ifsc2018
      ->(h) { [h[:result][0], h[:result][2], -h[:result][1], -h[:result][3]] }
    end

    # score? - returns 1 if the input value is non-zero/non-nil, 0 otherwise
    # sig { params(value: T.nilable(Integer)).returns(Integer) }
    def self.score(value)
      value.to_i.zero? ? 0 : 1
    end

    # subarray - returns an array of the attempts to gain either a Zone or a Top made on each
    # [of four] boulders, ordered best (fewest attempts) to worst
    # sig { params(hash: Hash, key: String, n: Integer).returns(T::Array[Integer]) }
    def self.subarray(hash, key, n = 4) # rubocop:disable Naming/UncommunicativeMethodParamName
      arr = Array.new(n, 0)

      hash.reduce(arr) { |a, (_k, v)| a.push(v[key].to_i) }.sort.slice(-n, n)
    end

    module_function

    # RANKING METHODS

    # sig { params(results: T::Array[Hash]).returns(T::Array[Hash]) }
    def add_rank(results)
      data = results.map { |x| x.merge(result: to_result_array(x[:result_jsonb])) }

      Ranker.rank(data, asc: true, strategy: :standard_competition, by: ifsc2018)
            .flat_map { |x| x.rankables.map { |r| r.merge(base: x.rank) } }
    end

    # sig { params(results: T::Array[Hash]).returns(T::Array[Hash]) }
    def add_atts(results)
      order = ->(h) { to_attempt_array(h[:result_jsonb]) }

      Ranker.rank(results, asc: false, strategy: :standard_competition, by: order)
            .flat_map { |x| x.rankables.map { |r| r.merge(ties: x.rank) } }
    end

    # RESULT AGGREGATION METHODS

    # result_array - return an integer array corresponding to the result T/TA/Z/ZA
    # input <hash> has the form: { "p1" => { "a" => 1, "b" => 1, "t" => 1 }, ... }
    # sig { params(hash: Hash).returns(T::Array[Integer]) }
    def to_result_array(hash)
      vec = Vector.zero(4)

      hash.reduce(vec) do |a, (_k, v)|
        a + Vector[score(v['t']), v['t'].to_i, score(v['b']), v['b'].to_i]
      end.to_a
    end

    # sig { params(hash: Hash).returns(T::Array[Integer]) }
    def to_attempt_array(hash)
      subarray(hash, 't') + subarray(hash, 'b')
    end
  end
end
