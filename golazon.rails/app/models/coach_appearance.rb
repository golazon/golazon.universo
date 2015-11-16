# Coach's match appearance
class CoachAppearance
  include Mongoid::Document

  # fake
  field :_id

  field :name, type: String

  belongs_to :person
  embeds_one :team_ref
end