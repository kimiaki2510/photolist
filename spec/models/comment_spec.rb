require 'rails_helper'

RSpec.describe Comment, type: :model do
   #コメントが有効か
   describe '#create' do
     it 'コメントが有効か' do
       user = FactoryBot.build(:user)
       record = user.records.build(:record)
       comment = record.comments.build(:comment)
       comment.valid?
       expect(comment).to be_valid
     end
     #バリデーション確認(100文字以上のコメントができない)
   end
end
