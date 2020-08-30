FactoryBot.define do
  factory :user do
    name { "ああああああああああ" }
    email { "Test@example.com" }
    password { "test1234" }
    password_digest { "test1234" }    
  end
end
