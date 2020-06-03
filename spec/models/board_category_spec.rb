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
