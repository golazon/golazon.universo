# Player's match appearance
class Appearance
  include Mongoid::Document

  # fake
  field :_id

  field :name, type: String

  field :min_in, type: Integer
  field :min_in_extra, type: Integer
  field :min_out, type: Integer
  field :min_out_extra, type: Integer

  belongs_to :person
  embeds_one :team_ref
end