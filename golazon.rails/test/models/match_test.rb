require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  test "the truth" do
    Match.delete_all

    match = Match.new
    match._id = "matchid"
    match.date = "2014-01-01"
    match.teams = [{name: "ARG"}, {name: "GER"}]
    match.scorecard = {score: [3, 1]}
    match.save!

    match = Match.last
    match.date = "2014-01-02"
    match.scorecard.update_attributes score: [4, 1], ht: [1, 0]
    match.teams[1].update_attributes name: "BRA"
    # match.update_attributes :date => "2014-01-03",
    #     :scorecard => { :score => [5, 2], :ht => [2, 0] },
    #     :teams => [{name: "ARG"}, {name: "URU"}]
    match.save!

    assert true
  end
end