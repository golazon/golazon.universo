class Goal < Event
  include TextifiedArray

  field :score, type: Array
  textified_array :score, separator: "-"
  # validates :score, length: { is: 2, allow_blank: true }

  field :type, type: String
  VALID_TYPES = %w(goal own penalty)
  validates :type, inclusion: { in: VALID_TYPES }
end