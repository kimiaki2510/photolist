require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    let!(:user){ FactoryBot.create(:user) }
    let!(:record){ FactoryBot.create(:record, owner: user) }
    #let!(:comment){ FactoryBot.create(:comment, owner: record) }
  end
   #コメントが有効か
   describe '#create' do
     #it 'コメントが有効か' do
       #comment = @record.comments.create(
         #content: "0123456789"
       #)
       #comment.valid?
       #expect(comment).to be_valid
     #end
     #バリデーション確認(100文字以上のコメントができない)
   end
end
