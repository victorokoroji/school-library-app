
class Rental
  
  attr_accessor :date
  
  def initialize(date)
    @date = date

    end
  
  def rental=(rental)
    @rental = rental
    rental.books.push(self) unless owner.books.include?(self)
  end
  
  end
