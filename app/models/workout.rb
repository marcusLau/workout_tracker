class Workout < ActiveRecord::Base
    serialize :exercises, Array
    serialize :weights, Array
    belongs_to :user

    def self.valid?(params)
        return !params[:title].empty? && !params[:date].empty? && !params[:exercises].empty? && !params[:weights].empty?
    end
end