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
require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'アソシエーション' do 
    let(:association) do 
      described_class.reflect_on_association(target)
    end

    context 'board' do 
      let(:target) { :board }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Board' }
    end

    context 'user' do 
      let(:target) { :user }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'User' }
    end
  end
end
