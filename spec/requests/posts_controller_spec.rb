require "rails_helper"

RSpec.describe "Posts controller", :type => :request do

  it "displays the posts show page" do
    get "/users/2/posts/1"
    expect(response).to render_template(:show)
  end

  # it ""

  it "displays the posts index page" do
    get "/users/2/posts"
    expect(response).to render_template(:index)
  end
end