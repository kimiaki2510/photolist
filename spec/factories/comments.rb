FactoryBot.define do
  factory :comment do
    id {1}
    content   { "MyTextBook" }
    user_id   { 1 }
    record_id { 1 }
  end
end
