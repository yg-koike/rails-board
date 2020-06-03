FactoryBot.define do
  factory :comment do
    name { 'hoge' }
    comment { 'コメント' }
    board
  end
end
