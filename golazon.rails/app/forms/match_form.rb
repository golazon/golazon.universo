require 'reform/form/coercion'

class MatchForm < Reform::Form
  include Coercion

  model :match

  property :date, type: Date, validates: { presence: true }

  property :time, validates: { format: { with: /^\d{2}\:\d{2}$/, multiline: true, allow_blank: true }}

  property :competition, populate_if_empty: MatchCompetition, prepopulate: ->(*) { MatchCompetition.new } do
    property :name
  end

  collection :teams, populate_if_empty: MatchTeam, prepopulate: ->(*) { [MatchTeam.new, MatchTeam.new] }  do
    property :name, validates: { presence: true }
  end

  property :scorecard, populate_if_empty: Scorecard, prepopulate: ->(*) { Scorecard.new } do
    property :score_text, validates: { format: { with: TextifiedArray::SCORE_TEXT_FORMAT, multiline: true, allow_blank: true }}
    property :pso_text, validates: { format: { with: TextifiedArray::SCORE_TEXT_FORMAT, multiline: true, allow_blank: true }}
  end

  property :venue, populate_if_empty: Venue, prepopulate: ->(*) { Venue.new } do
    property :name
    property :city
  end
end