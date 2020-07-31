class User < ActiveRecord::Base
    has_secure_password
    has_many :workouts

    def self.valid?(params)
        return !params[:name].empty? && !params[:email].empty? && !params[:password].empty?
    end
end