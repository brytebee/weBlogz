require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: "Good post", text: "this is my post") }

  it "Title must not be blank" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "Title must not exceed 250 characters" do
    subject.title.length <= 300
    expect(subject).to_not be_valid
  end
end
