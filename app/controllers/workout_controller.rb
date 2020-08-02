class WorkoutController < ApplicationController

    get '/workouts' do 
        @workouts = current_user.workouts.all
        if logged_in?
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
        if Workout.valid?(params)
            @workout = Workout.create( # This create method inserts into db
                title: params[:title],
                date: params[:date],
                exercises: params[:exercises],
                weights: params[:weights],
                user_id: @user.id
            )
            @workout.save
            @workouts = @user.workouts.all
            erb :'workouts/index'
        else
            redirect to '/workouts/new'
        end
    end

    get '/workouts/:id' do 
        @workout = Workout.find_by(id: params[:id])
        if logged_in? && @workout.user == current_user
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
        if Workout.valid?(params) 
            if @workout.update(title: params[:title], date: params[:date], exercises: params[:exercises], weights: params[:weights])
                erb :'workouts/show'
            end
        else
            redirect to '/workouts' # if params are invalid OR @workout.update fails, redirect back to /workouts
        end
    end

    # Can only delete if it belongs to that user
    delete '/workouts/:id/delete' do 
        @workout = current_user.workouts.find_by(id: params[:id])
        if @workout 
            @workout.destroy
            redirect to '/workouts'
        else
            redirect to '/workouts/#{@workout.id}'
        end

    end
end