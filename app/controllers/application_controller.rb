require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do 
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      puts session[:id]
      if User.all.empty?
        # Do not check for session ID within user if there exists no Users yet.
      else 
        @current_user ||= User.find(session[:id]) if session[:id]
      end
    end
  end

end
