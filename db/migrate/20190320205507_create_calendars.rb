class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.string :title
      t.datetime :date
      t.text :description
      t.reference :board

      t.timestamps
    end
  end
end
