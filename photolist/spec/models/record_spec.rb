require 'rails_helper'

RSpec.describe Record, type: :model do
  it "is be_valid with title content" do
    record = Record.new(
      title: "aaaa",
      content: "dijdjidji",
      photo: default.jpg,
      user_id: 1
    )
    expect(record).to be_valid
  end
end
