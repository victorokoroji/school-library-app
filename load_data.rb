require './rental'
require './student'
require './teacher'
require './book'
require 'json'

def initialize_files
  File.write('./data/books.json', []) unless File.exist?('./data/books.json')
  File.write('./data/people.json', []) unless File.exist?('./data/people.json')
  File.write('./data/rentals.json', []) unless File.exist?('./data/rentals.json')
end

def load_books
  books = []
  books_store = JSON.parse(File.read('./data/books.json'))

  books_store.each do |book|
    books << Book.new(book['title'], book['author'])
  end
  books
end

def load_people
  people = []
  people_store = JSON.parse(File.read('./data/people.json'))

  people_store.each do |person|
    people << case person['role']
              when 'Student'
                Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
              when 'Teacher'
                Teacher.new(person['age'], person['specialization'], person['name'])
              end
  end
  people
end

def load_rentals(books, people)
  rental_list = []
  rentals_store = JSON.parse(File.read('./data/rentals.json'))
  rentals_store.each do |rental|
   rental_list << Rental.new(rental['date'],
                          books.select { |book| book.title == rental['title'] } [0],
                          people.select { |person| person.name == rental['name'] } [0])
  end
  rental_list
end
