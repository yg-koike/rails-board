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
require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = create(:user)
  end

  describe 'バリデーション' do 
    context '正常な値の場合' do 
      it 'nameとpasswordどちらも正常な値が設定されいるのでOKであること' do 
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
    end
  end
end
