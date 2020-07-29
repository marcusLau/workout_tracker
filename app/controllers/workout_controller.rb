class WorkoutController < ApplicationController

    get '/workouts' do 
        @users = User.all
        @workouts = Workout.all
        erb :'workouts/show'
    end

end