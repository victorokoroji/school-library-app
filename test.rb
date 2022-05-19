require './person'
require './capitalize_decorator'
require './trimmer_decorator'

person = Person.new(22, 'maximilianus')
person.correct_name
puts(person.correct_name)
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
puts(capitalized_person.correct_name)
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name
puts(capitalized_trimmed_person.correct_name)
