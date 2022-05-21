require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id, : rentals
  attr_accessor :name, :age

  def can_use_services?
    is_of_age || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rentals(rental)
    @rentals.push(rental)
    rental.owner = self
  end

  private

  def of_age?
    age >= 18
  end
end
