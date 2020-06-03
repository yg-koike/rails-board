require 'rails_helper'

RSpec.describe Category, type: :model do
  before do 
    @category = create(:category)
  end

  describe 'バリデーション' do 
    context '正常な値の場合' do 
      it 'nameに正常な値が設定されているのでOKであること' do 
        expect(@category.valid?).to eq(true)
      end

      it 'nameが10文字の場合OKであること' do 
        @category.name = 'n' * 10
        expect(@category.valid?).to eq(true)
      end
    end

    context '異常な値の場合' do 
      it 'nameが空の場合NGであること' do 
        @category.name = ''
        expect(@category.valid?).to eq(false)
      end

      it 'nameが11文字の場合NGであること' do 
        @category.name = 'n' * 11
        expect(@category.valid?).to eq(false)
      end

      it '既に存在するnameの場合NGであること' do 
        other = build(:category)
        expect(other.valid?).to eq(false)
      end
    end
  end

  describe 'アソシエーション' do 
    let(:association) do 
      described_class.reflect_on_association(target)
    end

    context 'board_categories' do 
      let(:target) { :board_categories }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'BoardCategory' }
    end

    context 'boards' do 
      let(:target) { :boards }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Board' }
    end
  end
end
