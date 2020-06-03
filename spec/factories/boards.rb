FactoryBot.define do
  factory :board do
    title { 'タイトル' }
    body { '内容' }
    user
  end
end
