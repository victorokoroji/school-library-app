require 'json'
require  './rental'

def initialize_files
  File.write('./datas/books.json', []) unless File.exist?('./datas/books.json')
  File.write('./datas/people.json', []) unless File.exist?('./datas/people.json')
  File.write('./datas/rental.json', []) unless File.exist?('./datas/rental.json')
end

def load_books
  books = []
  books_store = JSON.parse(File.read('./data/books.json'))

  books_store.each do |book|
  books << Book.new(book['title'], book['author'])
  end
  books
end

def load_persons
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
  persons
end

def load_rentals(books, persons)
  rentals = []
  rentals_save = JSON.parse(File.read('./data/rentals.json'))
  rentals_save.each do |r|
  rentals << Rental.new(r['date'],
                          books.select { |b| b.title == r['title'] } [0],
                          persons.select { |person| person.name == r['name'] } [0])
  end
  rentals
end