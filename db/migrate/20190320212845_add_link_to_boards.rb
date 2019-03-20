class AddLinkToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :link, :string
  end
end
