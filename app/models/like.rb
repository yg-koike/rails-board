# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#  user_id    :integer
#
class Like < ApplicationRecord
  belongs_to :board, counter_cache: :likes_count
  belongs_to :user
end
