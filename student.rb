require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, parent_permission: true)
    super(parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
