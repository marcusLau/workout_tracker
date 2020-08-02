class Workout < ActiveRecord::Base
    serialize :exercises, Array
    serialize :weights, Array
    belongs_to :user

    def self.empty_arr?(arr)
        result = true
        arr.each do |a|
            if a == ""
                result = false
                return result
            end
        end
        return result
    end

    # only want valid to be true IFF all parameters have an element OR not ""
    def self.valid?(params)
        return !params[:title].empty? && !params[:date].empty? && empty_arr?(params[:exercises]) && empty_arr?(params[:weights])
    end

    # because there exists "" elements in the array, the .empty? method returns false, which makes
    # the whole valid? method return false 
    # "".empty? -> true
    # ["", "", ""].empty? -> false
end