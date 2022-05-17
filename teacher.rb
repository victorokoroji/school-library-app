require './person'

class Teacher < person
  def initialize(specialization)
    super
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
