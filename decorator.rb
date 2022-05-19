require './nameable'

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  attr_reader :nameable

  def correct_name
    @nameable.correct_name
  end
end
