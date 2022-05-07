require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Anny', post_counter: 1) }

  it 'Name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name must not be blank' do
    subject.name = 'Anny'
    expect(subject).to be_valid
  end

  it 'Post counter must be an integer' do
    subject.post_counter = 'Bright'
    expect(subject).to_not be_valid
  end

  it 'Post counter must be an integer' do
    subject.post_counter = 1
    expect(subject).to be_valid
  end
end
