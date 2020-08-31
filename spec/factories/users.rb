FactoryBot.define do
  factory :user do
    name { "ああああああああああ" }
    email { "Test@example.com" }
    password { "test1234" }
    password_digest { "test1234" }
  end

  factory :taro, class: User do
    name             { "Taro" }
    email            { "taro@example.com" }
    password         { "taro1234" }
    password_digest  { "taro1234" }
  end

  factory :jiro, class: User do
    name             { "Jiro" }
    email            { "jiro@example.com" }
    password         { "jiro1234" }
    password_digest  { "jiro1234" }
  end
end
