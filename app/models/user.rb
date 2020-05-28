# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  image           :string(255)
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  user_name       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
  has_many :boards, dependent: :destroy
  has_secure_password
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy 
  has_many :like_boards, through: :likes, source: :board

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 15 },
    format: {
      with: /\A[a-z0-9]+\z/,
      message: 'は小文字英数字で入力してください'
    }
  validates :password,
    length: { minimum: 8, maximum: 16 }

  validates :user_name, presence: true, length: { maximum: 10 }
 
end
