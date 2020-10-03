# Module  Perseus                 - The namespace for application code
# Module  StandardLeadModus       - IFSCLeadModus methods

require 'ranker'

require_relative 'fractional_competition'

module Perseus
  module StandardLeadModus
    # private_class_method

    # ifsc2018 - ranking model for the 2018 sseason onward (T/Z/TA/ZA)
    # sig ( returns(Proc.params(h: Hash).returns(T::Array[Integer])) }
    def self.ifsc1999(key, data)
      order  = ->(h)    { h.delete(key) }
      append = ->(x, h) { h.tap { |r| r[:points].push(x) } }

      Ranker.rank(data, asc: true, strategy: FractionalCompetition, by: order)
            .flat_map { |x| x.rankables.map(&append.curry[x.rank]) }
    end

    module_function

    # RANKING METHODS

    # TODO: Make this generic for [n] routes
    # sig { params(results: T::Array[Hash]).returns(T::Array[Hash]) }
    def add_rank(results)
      results.map { |x| x.merge(to_result_array(x[:result_jsonb])) }
             .yield_self(&method(:ifsc1999).curry['r1'])
             .yield_self(&method(:ifsc1999).curry['r2'])
    end

    # tie_break - Use the time from the first route as a tie-break
    # NOTE: This (obviously) doesn't work if there are two or more routes
    # sig { params(results: T::Array[Hash]).returns(T::Array[Hash]) }
    def add_time(results)
      results.map { |h| h.merge(time: h[:result_jsonb].dig('r1', 't').to_f) }
    end

    # RESULT AGGREGATION METHODS

    # sig { params(result_hash: Hash).returns(Hash) }
    # input hash has the form: { 'r1' => { "h" => 33, "m" => 1, "t" => 1 }, ... }
    # output hash has the form { 'r1' => [1.0, 2.0], 'r2' => [3.0, 4.0] }
    # TODO: Make this generic for [n] routes
    def to_result_array(result_hash)
      %w[r1 r2].map do |k|
        [k, result_hash[k] ? [result_hash[k]['h'].to_i, result_hash[k]['m'].to_i] : [0, 0]]
      end.to_h
    end
  end
end
