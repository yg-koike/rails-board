# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_likes_on_board_id              (board_id)
#  index_likes_on_user_id               (user_id)
#  index_likes_on_user_id_and_board_id  (user_id,board_id) UNIQUE
#
FactoryBot.define do
  factory :like do
    user_id { 1 }
    board_id { 1 }
  end
end
