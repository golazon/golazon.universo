class Match
  include Mongoid::Document

  field :_id, type: String

  # Kick-off date (UTC)
  # (it's a string as date might be incomplete)
  field :date, type: String

  # Kick-off time (UTC)
  field :time, type: String

  # Home and away team
  embeds_many :teams, class_name: "MatchTeam"

  # Scorecard
  embeds_one :scorecard

  # Competition
  embeds_one :competition, class_name: "MatchCompetition"

  # Goals
  embeds_many :goals

  # Line-up
  embeds_many :appearances
  alias_method :players, :appearances

  # Coaches
  embeds_many :coach_appearances
  alias_method :coaches, :coach_appearances
  validates :coach_appearances, length: { is: 2, allow_blank: true }

  # Venue
  embeds_one :venue

  # Neutral ground
  field :neutral, type: Boolean

  # Special match status
  field :status, type: String
  validates :status, inclusion: { in: %w(suspended postponed), allow_blank: true }

  include Mongoid::Timestamps

  set_callback(:create, :before) do |match|
    match._id = "#{match.date} #{match.teams[0].name} #{match.teams[1].name}".parameterize
  end

  def score
    scorecard && scorecard.score_text
  end

  def competition_name
    competition && competition.name
  end
end