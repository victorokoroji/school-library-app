require './decorator.rb'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.name.toUpperCase()
  end
end