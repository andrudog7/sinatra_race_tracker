class AddDateToRacesTable < ActiveRecord::Migration
  def change
    add_column :races, :date, :string
  end
end
