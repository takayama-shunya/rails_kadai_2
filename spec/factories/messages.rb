FactoryBot.define do
  factory :message do
    body { "MyText" }
    user { nil }
    conversion { nil }
  end
end
