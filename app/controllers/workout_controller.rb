class WorkoutController < ApplicationController

    get '/workouts' do 
        @workouts = Workout.all
        if logged_in?
            @user = current_user
            erb :'workouts/index'
        else
            redirect to '/login'
        end
    end

    get '/workouts/new' do 
        if logged_in?
            erb :'workouts/new'
        else
            redirect to '/login'
        end
    end

    post '/workouts/new' do 
        @user = current_user
        @workout = Workout.create(
            title: params[:title],
            date: params[:date],
            exercises: params[:exercises],
            user_id: @user.id
        )
        if @workout.save
            @workouts = Workout.all
            erb :'workouts/index'
        else
            redirect to '/workouts/new'
        end
    end

    get '/workouts/:id' do 
        if logged_in?
            @workout = Workout.find_by(id: params[:id])
            erb :'workouts/show'
        else
            redirect to '/login'
        end
    end

    get '/workouts/:id/edit' do 
        @workout = Workout.find_by(id: params[:id])
        if logged_in? && @workout.user == current_user
            erb :'workouts/edit'
        else
            redirect to '/login'
        end
    end

    # updates workout with new params
    patch '/workouts/:id/edit' do 
        @workout = Workout.find_by(id: params[:id])
        @user = current_user
        if @workout.update(title: params[:title], date: params[:date], exercises: params[:exercises])
            erb :'workouts/show'
        else
            redirect to '/workout/#{@workout.id}/edit'
        end
    end


end