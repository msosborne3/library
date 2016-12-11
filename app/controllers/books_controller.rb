class BooksController < ApplicationController
  # Loads the book page for a specific book
  get '/books/:slug' do
    if logged_in? # If the user is logged in, they can view a book page
      @book = Book.find_by_slug(params[:slug])

      erb :'/books/show'
    else
      redirect to '/login' # Otherwise, they're redirected to the login page
    end
  end

end