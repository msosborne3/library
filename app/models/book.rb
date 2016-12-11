class Book < ActiveRecord::Base
  has_many :user_books
  has_many :users, :through => :user_books

  # Converts a book title from "Harry Potter" to "harry-potter"
  def slug
    name.downcase.gsub(' ', '-')
  end

  # Finds the book by the slugified version of its name
  def self.find_by_slug(slug)
    Book.all.find{|book| book.slug == slug}
  end
end