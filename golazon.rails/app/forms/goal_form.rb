class GoalForm < Reform::Form
  model :goal

  property :type, validates: { presence: true }

  property :name, validates: { presence: true }
  property :min
  property :min_extra

  property :score_text, validates: { format: { with: TextifiedArray::SCORE_TEXT_FORMAT, multiline: true, allow_blank: true }}

  property :team, populate_if_empty: MatchTeam, prepopulate: ->(*) { MatchTeam.new }  do
    property :name, validates: { presence: true }
  end
end