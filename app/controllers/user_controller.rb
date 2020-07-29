class UserController < ApplicationController

    get '/signup' do 
        if logged_in? 
            redirect to '/workouts'
        else
            erb :"users/signup"
        end
    end

    post '/signup' do 
        @user = User.new(params)
        if @user.save
            session[:id] = @user.id
            redirect to '/workouts' 
        else
            redirect to '/signup'
        end
    end

    get '/login' do 
        if logged_in?
            redirect to '/workouts'
        else
            erb :'users/login'
        end
    end

    post '/login' do 
        @user =  User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect to '/workouts'
        else
            redirect to '/login'
        end
    end

    get '/logout' do 
        if logged_in?
            session.clear
            redirect to '/login'
        else
            redirect to '/'
        end
    end
end