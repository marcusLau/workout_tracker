require './config/environment'

class UserController < ApplicationController

    get '/signup' do 
        if logged_in? 
            redirect to '/workouts'
        else
            erb :'users/signup'
        end
    end
end