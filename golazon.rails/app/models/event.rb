# Match event (goal, booking, etc)
class Event
  include Mongoid::Document

  embedded_in :match

  # field :_id, type: String

  # Person name
  field :name, type: String

  field :min, type: Integer
  field :min_extra, type: Integer

  # belongs_to :person
  embeds_one :team, class_name: "MatchTeam"
end