class Workouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |s|
      s.string :title
      s.datetime :date
      s.text :exercises
      s.integer :user_id
    end
  end
end
