class AddLikesCountToBoard < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :likes_count, :integer
  end
end
