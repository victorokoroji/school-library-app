require './person'

class Teacher < Person

  attr_accessor :specialization
  
  def initialize(specialization, parent_permission: true)
    super(parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
