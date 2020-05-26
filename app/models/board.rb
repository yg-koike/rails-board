# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  body        :text(65535)
#  likes_count :integer
#  name        :string(255)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Board < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :board_categories, dependent: :delete_all
  has_many :categories, through: :board_categories
  has_many :likes, dependent: :destroy 
  has_many :liking_users, through: :likes, source: :user

  validates :name, presence: true, length: { maximum: 10 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 500 }
end
