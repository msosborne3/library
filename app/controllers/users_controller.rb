class UsersController < ApplicationController

  # Loads the create_user page, which contains a form to create a new user
  get '/signup' do
    if logged_in? # If a user is already logged in, then they can't sign up
      redirect to "/users/#{current_user.id}"
    else
      erb :'/users/create_user'
    end
  end


end