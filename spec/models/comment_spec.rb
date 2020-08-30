require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @record = @user.records.create(
      title:   "vbfraafdda",
      content: "dijdjidji",
      photo:   Rack::Test::UploadedFile.new(File.join(Rails.root, '/public/images/default.jpg'))
    )
  end
   #コメントが有効か
   describe '#create' do
     it 'コメントが有効か' do
       comment = @record.comments.create(
         content: "0123456789"
       )
       comment.valid?
       expect(comment).to be_valid
     end
     #バリデーション確認(100文字以上のコメントができない)
   end
end
