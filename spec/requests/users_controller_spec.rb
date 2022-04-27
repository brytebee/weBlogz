require "rails_helper"

RSpec.describe "Users controller", :type => :request do
  it "displays the users index page" do
    get "/users"
    expect(response).to render_template(:index)
  end

  it "displays the users show page" do
    get "/users/20"
    expect(response).to render_template(:show)
  end
end