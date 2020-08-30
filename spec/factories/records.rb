FactoryBot.define do
  factory :record do
    title   { "vbfraafdda" }
    content { "dijdjidji" }
    photo   { Rack::Test::UploadedFile.new(File.join(Rails.root, '/public/images/default.jpg')) }    
  end
end
