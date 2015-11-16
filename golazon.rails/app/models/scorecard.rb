class Scorecard
  include Mongoid::Document
  include TextifiedArray

  embedded_in :match

  # fake
  field :_id

  # Final score (after 2nd half or after extra time)
  field :score, type: Array
  textified_array :score, separator: "-"

  # Half-time (1st half) score
  field :ht, type: Array
  textified_array :ht, separator: "-"

  # After 2nd half score
  field :ft, type: Array
  textified_array :ft, separator: "-"

  # After extra time score
  field :aet, type: Array
  textified_array :aet, separator: "-"

  # Penalty shootout score
  field :pso, type: Array
  textified_array :pso, separator: "-"

  # TODO: walkover (wo) -> Array or Bool? or at Match level?
end