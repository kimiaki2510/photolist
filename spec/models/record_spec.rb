require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @record = @user.records.build(
      title:   "vbfraafdda",
      content: "dijdjidji",
      photo:   Rack::Test::UploadedFile.new(File.join(Rails.root, '/public/images/default.jpg'))
    )
  end
  it "投稿が有効であるか" do
    @record.valid?
    expect(@record).to be_valid
  end
  #投稿のバリデーション確認(タイトル30文字)
  it "タイトルが30文字より大きい時falseを出力" do
    record = @user.records.new(
      title:   "0123456789012345678901234567890",
      content: "dijdjidji",
      photo:   Rack::Test::UploadedFile.new(File.join(Rails.root, '/public/images/default.jpg'))
    )
    expect(record.save).to eq(false)
  end
  #投稿のバリデーション確認(内容255文字)
  it "contentが255文字より大きい時falseを出力" do
    record = @user.records.new(
      title:   "vbfraafdda",
      content: "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345",
      photo:   Rack::Test::UploadedFile.new(File.join(Rails.root, '/public/images/default.jpg'))
    )
    expect(record.save).to eq(false)
  end
end
