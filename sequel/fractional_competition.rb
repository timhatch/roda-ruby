require 'ranker'

class FractionalCompetition < Ranker::Strategies::Strategy
  def execute
    rank = 1
    scores_unique_sorted.each { |score|
      rankables_for_score = rankables_for_score(score)
      fractional_rank     = rank + (rankables_for_score.count - 1) / 2.0

      create_ranking(fractional_rank, score, rankables_for_score)
      rank += rankables_for_score.count
    }
  end
end
