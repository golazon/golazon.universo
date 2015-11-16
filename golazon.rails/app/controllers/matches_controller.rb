class MatchesController < ApplicationController
  def index
    @matches = Match.order_by({date: "DESC", time: "DESC"})
  end
end
