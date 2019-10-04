require 'sequel'

require_relative 'result'

class Competition < Sequel::Model(:competitions)
  one_to_many :results, key: :wet_id

  # def before_create
  #   values[:wet_id] ||= :nextval # .qualify(:Soperations)
  #   super
  # end

  # registrants - return a list of climbers/officials registered for a competition
  # sig { params(grp_id: Integer).returns(T::Array[Hash]) }
  def registrants(grp_id:)
    results.select { |r| r.grp_id.eql?(grp_id) }
           .uniq
           .map    { |r| r.person.to_hash.merge(per_id: r.per_id) }
  end

  # starters - return a list of starters for a given category and route
  # sig { params(grp_id: Integer, route: Integer).returns(T::Array[Hash]) }
  def starters(grp_id:, route:)
    results.select { |r| r.grp_id.eql?(grp_id) && r.route.eql?(route) }
           .map    { |r| r.person.to_hash }
  end
end
