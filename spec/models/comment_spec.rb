# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text(65535)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do 
    @comment = create(:comment)
  end

  describe 'バリデーション' do 
    context '正常な値の場合' do
      it 'nameとcommentどちらも正常な値が設定されているのでOKであること' do 
        expect(@comment.valid?).to eq(true)
      end
      
      it 'nameが10文字の場合OKであること' do 
        @comment.name = 'n' * 10
        expect(@comment.valid?).to eq(true)
      end

      it 'commentが400文字の場合OKであること' do 
        @comment.comment = 'c' * 400
        expect(@comment.valid?).to eq(true)
      end
    end

    context '異常な値の場合' do 
      it 'nameが空の場合NGであること' do 
        @comment.name = ''
        expect(@comment.valid?).to eq(false)
      end

      it 'nameが11文字の場合NGであること' do 
        @comment.name = 'n' * 11
        expect(@comment.valid?).to eq(false)
      end

      it 'commentが空の場合NGであること' do 
        @comment.comment = ''
        expect(@comment.valid?).to eq(false)
      end

      it 'commentが401文字の場合NGであること' do 
        @comment.comment = 'c' * 401
        expect(@comment.valid?).to eq(false)
      end
    end
  end

  describe 'アソシエーション' do 
    let(:association) do 
      described_class.reflect_on_association(target)
    end
    
    context 'board' do 
      let(:target) { :board }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Board' }
    end
  end
end
