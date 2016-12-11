class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :"users/show"
  end

  # Loads the create_user page, which contains a form to create a new user
  get '/signup' do
    if logged_in? # If a user is already logged in, then they can't sign up
      redirect to "/users/#{current_user.slug}"
    else
      erb :'/users/create_user'
    end
  end

  # Gets the input from the form and creates a new user
  post '/signup' do
    # If the user did not enter a username, email, and password then they have to fill out the form again
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else  # Otherwise a new user is created with the info and the user is then redirected to their profile page
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.slug}"
    end
  end




end