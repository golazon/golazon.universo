class Venue
  include Mongoid::Document

  embedded_in :match

  # fake
  field :_id

  field :name, type: String
  field :city, type: String
end