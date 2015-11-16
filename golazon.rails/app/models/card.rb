class Card < Event
  field :type, type: String
  validates :type, inclusion: { in: %w(yellow red) }
end