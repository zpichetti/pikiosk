class ChangeFormatDatetimeToDateForArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :date, :date
    change_column :articles, :end_date, :date
  end
end
