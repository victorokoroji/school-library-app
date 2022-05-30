require './student'
require'./teacher'
require './rental'

def store_data(books, persons, rentals)
  store_books(books)
  store_persons(persons)
  store_rentals(rentals)
end

def store_books(books)
  books_store = []
  books.each do |book|
    books_store << {
      title: book.title,
      author: book.author
    }
  end

  ruby = JSON.generate(books_store)

  File.write('./data/books.json', ruby.to_s)
end

def store_persons(persons)
  persons_store = []
  persons.each do |person|
    persons_store << if person.instance_of? Student
                      {
                        json_class: 'Student',
                        name: person.name,
                        age: person.age,
                        classroom: person.classroom,
                        parent_permission: person.parent_permission
                      }
                    elsif person.instance_of? Teacher
                      {
                        json_class: 'Teacher', name: person.name, age: person.age, specialization: person.specialization
                      }
                    end
  end

  ruby = JSON.generate(persons_store)

  File.write('./data/people.json', ruby.to_s)
end

def store_rentals(rentals)
  data = []
  rentals.each do |rental|
    data.push({
                date: rental.date,
                person_id: rental.person.id,
                book_id: rental.book.id,
                name: rental.person.name,
                title: rental.book.title,
                author: rental.book.author
              })
  end

  ruby = JSON.generate(data)

  File.write('./data/rentals.json', ruby)
end