require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Good post', text: 'this is my post') }

  it 'Title must not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Comment counter must be an integer greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Like counter must be an integer greater than or equal to zero ' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
