class BooksController < ApplicationController
  # Loads the book page for a specific book
  #get '/books/:slug' do
  #  if logged_in? # If the user is logged in, they can view a book page
  #    @book = Book.find_by_slug(params[:slug])
#
  #    erb :'/books/show'
  #  else
  #    redirect to '/login' # Otherwise, they're redirected to the login page
  #  end
  #end

  get '/books/new' do
    if logged_in?
      erb :'/books/create_book'
    else
      redirect to '/login'
    end
  end

  post '/books' do
    @user = current_user

    if params[:books]
      @user.books << params[:books]
    end

    if params[:name] != "" && params[:author] != "" && params[:genre] != ""
      current_user.books.create(name: params[:name], author: params[:author], genre: params[:genre])
    end

    redirect to "/users/#{current_user.slug}"
  end

end