# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  image           :string(255)
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  user_name       :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = create(:user)
  end

  describe '.connection_config' do 
    it '指定のDBに接続していること' do 
      expect(described_class.connection_config[:database]).to match(/webapp_test/)
      expect(described_class.connection_config[:database]).not_to match(/webapp_production/)
    end
  end

  describe 'バリデーション' do 
    context '正常な値の場合' do 
      it 'nameとpasswordとuser_nameどれも正常な値が設定されいるのでOKであること' do 
        expect(@user.valid?).to eq(true)
      end

      it 'nameが15文字の時OKであること' do 
        @user.name = 'n' * 15
        expect(@user.valid?).to eq(true)
      end

      it 'passwordが16文字の時OKであること' do 
        @user.password = 'p' * 16
        @user.password_confirmation = 'p' * 16
        expect(@user.valid?).to eq(true)
      end

      it 'user_nameが10文字の時OKであること' do 
        @user.user_name = 'u' * 10
        expect(@user.valid?).to eq(true)
      end
    end

    context '異常な値の場合' do
      it 'nameが空の場合NGであること' do 
        @user.name = ''
        expect(@user.valid?).to eq(false)
      end

      it 'nameに小文字英数字以外が含まれる場合NGであること' do
        @user.name = 'HOGE'
        expect(@user.valid?).to eq(false)
      end
      
      it 'nameが16文字の場合NGであること' do 
        @user.name = 'n' * 16
        expect(@user.valid?).to eq(false)
      end

      it '既に存在するnameの場合NGであること' do 
        other = build(:user)
        expect(other.valid?).to eq(false)
      end

      it 'passwordが7文字の場合NGであること' do 
        @user.password = 'p' * 7
        @user.password_confirmation = 'p' * 7
        expect(@user.valid?).to eq(false)
      end

      it 'passwordが17文字の場合NGであること' do 
        @user.password = 'p' * 17
        @user.password_confirmation = 'p' * 17
        expect(@user.valid?).to eq(false)
      end

      it 'passwordの値とpassword_confirmationの値が異なるときNGであること' do 
        @user.password_confirmation = 'password2'
        expect(@user.valid?).to eq(false)
      end

      it 'user_nameが空の場合NGであること' do 
        @user.user_name = ''
        expect(@user.valid?).to eq(false)
      end

      it 'user_nameが11文字の場合NGであること' do 
        @user.user_name = 'u' * 11
        expect(@user.valid?).to eq(false)
      end
    end
  end

  describe 'アソシエーション' do 
    let(:association) do 
      described_class.reflect_on_association(target)
    end

    context 'boards' do 
      let(:target) { :boards }

      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Board' }
    end

    context 'likes' do 
      let(:target) { :likes }

      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Like' }
    end

    context 'like_boards' do 
      let(:target) { :like_boards }

      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Board' }
    end
  end
end
