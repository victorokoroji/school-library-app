require './rental'
require './student'
require './teacher'
def initialize_files
  File.write('./datas/books.json', []) unless File.exist?('./datas/books.json')
  File.write('./datas/people.json', []) unless File.exist?('./datas/people.json')
  File.write('./datas/rentals.json', []) unless File.exist?('./datas/rentals.json')
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
  rentals_store = JSON.parse(File.read('./data/rentals.json'))
  rentals_store.each do |rental|
    rentals << Rental.new(rental['date'],
                          books.select { |book| book.title == rental['title'] } [0],
                          persons.select { |person| person.name == r['name'] } [0])
  end
  rentals
end
