# == Schema Information
#
# Table name: board_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  board_id    :bigint
#  category_id :bigint
#
# Indexes
#
#  index_board_categories_on_board_id     (board_id)
#  index_board_categories_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (category_id => categories.id)
#
require 'rails_helper'

RSpec.describe BoardCategory, type: :model do
  describe 'アソシエーション' do 
    let(:association) do 
      described_class.reflect_on_association(target)
    end

    context 'board' do 
      let(:target) { :board }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Board' }
    end

    context 'category' do 
      let(:target) { :category }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Category' }
    end
  end
end
