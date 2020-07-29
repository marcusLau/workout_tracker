class Workout < ActiveRecord::Base
    serialize :exercises, Array
    belongs_to :user
end