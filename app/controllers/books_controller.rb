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

  # Loads the page to add/create new books
  get '/books/new' do
    if logged_in? # If the user is logged in, they can add a book
      erb :'/books/create_book'
    else
      redirect to '/login' # Otherwise, they're redirected to the login page
    end
  end

  # Gets the input from the new book page
  post '/books' do
    @user = current_user

    # If the user checks any current books, they're added to the user's booklist
    if params[:books]
      @user.books << params[:books]
    end

    # If the user enters a new book, it is created and added to the booklist
    if params[:name] != "" && params[:author] != "" && params[:genre] != ""
      current_user.books.create(name: params[:name], author: params[:author], genre: params[:genre])
    end

    # The user is then redirected to their profile page with their booklist
    redirect to "/users/#{current_user.slug}"
  end

end