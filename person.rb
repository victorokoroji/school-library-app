require './nameable.rb'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Math.floor(Math.random * 10)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    is_of_age || @parent_permission
  end

  def correct_name
    @name
  end
  private

  def of_age?
    age >= 18
  end
end
