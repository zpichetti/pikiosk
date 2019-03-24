class AddLocationToCalendars < ActiveRecord::Migration[5.2]
  def change
    add_column :calendars, :location, :string
    add_column :calendars, :city, :string
  end
end
