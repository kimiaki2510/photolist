FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user_id { 1 }
    record_id { 1 }
  end
end
