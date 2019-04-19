class AddEndDateToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :end_date, :datetime
  end
end
