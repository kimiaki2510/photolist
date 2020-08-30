require 'rails_helper'

RSpec.describe Record, type: :model do
  it "投稿が有効であるか" do
    user = FactoryBot.build(:user)
    record = user.records.build(:record)
    record.valid?
    expect(record).to be_valid
  end
  #投稿のバリデーション確認
end
