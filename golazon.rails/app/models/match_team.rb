class MatchTeam
  include Mongoid::Document

  embedded_in :match

  # fake
  field :_id

  field :name, type: String

  # belongs_to :team
end