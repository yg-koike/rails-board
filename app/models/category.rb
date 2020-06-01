# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
class Category < ApplicationRecord
  has_many :board_categories, dependent: :delete_all
  has_many :boards, through: :board_categories

  validates :name, presence: true,
    uniqueness: true,
    length: { maximum: 10 }
end
