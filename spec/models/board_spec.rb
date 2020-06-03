require 'rails_helper'

RSpec.describe Board, type: :model do
  before do 
    @board = create(:board)
  end

  describe 'バリデーション' do 
    context '正常な値の場合' do 
      it 'titleとbodyどちらも正常な値が設定されているのでOKであること' do 
        expect(@board.valid?).to eq(true)
      end

      it 'titleが50文字の場合OKであること' do 
        @board.title = 't' * 50
        expect(@board.valid?).to eq(true)
      end

      it 'bodyが500文字の場合OKであること' do 
        @board.body = 'b' * 500
        expect(@board.valid?).to eq(true)
      end
    end

    context '異常な値の場合' do 
      it 'titleが空の場合NGであること' do 
        @board.title = ''
        expect(@board.valid?).to eq(false)
      end

      it 'titleが51文字の場合NGであること' do 
        @board.title = 't' * 51
        expect(@board.valid?).to eq(false)
      end

      it 'bodyが空の場合NGであること' do 
        @board.body = ''
        expect(@board.valid?).to eq(false)
      end
      
      it 'bodyが501文字の場合NGであること' do 
        @board.body = 'b' * 501
        expect(@board.valid?).to eq(false)
      end
    end
  end

  describe 'アソシエーション' do 
    let(:association) do 
      described_class.reflect_on_association(target)
    end

    context 'user' do 
      let(:target) { :user }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'User' }
    end

    context 'comments' do 
      let(:target) { :comments }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Comment' }
    end

    context 'board_categories' do 
      let(:target) { :board_categories }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'BoardCategory' }
    end

    context 'categories' do 
      let(:target) { :categories }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Category' }
    end

    context 'likes' do 
      let(:target) { :likes }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Like' }
    end

    context 'liking_users' do 
      let(:target) { :liking_users }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'User' }
    end
  end
end
