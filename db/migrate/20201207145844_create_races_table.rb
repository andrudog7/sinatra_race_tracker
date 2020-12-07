class CreateRacesTable < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.text :name
      t.text :type
      t.text :location
      t.string :finish_time
      t.string :pace
      t.integer :user_id
    end
  end
end
