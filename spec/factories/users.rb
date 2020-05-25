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
FactoryBot.define do
  factory :user do
    name { 'hoge' }
    password { 'password' }
    password_confirmation { "password" }
    user_name { "サンプルネーム" }
  end
end
