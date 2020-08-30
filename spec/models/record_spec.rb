require 'rails_helper'

RSpec.describe Record, type: :model do
  it "投稿が有効であるか" do
    record = Record.new(
      title: "aaaa",
      content: "dijdjidji",
      photo: /public/images/defa.jpg,
      user_id: 2
    )
    expect(record).to be_valid
  end
end
