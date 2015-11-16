# Person (player and/or coach)
class Person
  include Mongoid::Document

  field :_id, type: String

  field :name, type: String

  field :first_name, type: String
  field :last_name, type: String
end