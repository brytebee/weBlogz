require 'rails_helper'

RSpec.describe 'Posts controller', type: :request do
  it 'displays the posts show page' do
    get '/users/2/posts/1'
    expect(response).to render_template(:show)
  end

  it 'displays the page content on the posts show page' do
    get '/users/2/posts/1'
    expect(response.body).to include('This is the sample posts show page')
  end

  it 'displays the posts index page' do
    get '/users/2/posts'
    expect(response).to render_template(:index)
  end

  it 'displays the posts index page content' do
    get '/users/2/posts'
    expect(response.body).to include('Post#Index')
  end
end
