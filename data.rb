require 'json'

def initialize_files
  File.write('./datas/book.json', []) unless File.exist?('./datas/book.json')
  File.write('./datas/people.json', []) unless File.exist?('./datas/people.json')
  File.write('./datas/rental.json', []) unless File.exist?('./datas/rental.json')
end

def read_books
  books = []
  JSON.parse(File.read('./datas/book.json')).each do |book|
    books.push(Book.new(book['title'], book['author']))
  end
  books
end