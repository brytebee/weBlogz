require "rails_helper"

RSpec.describe "Posts controller", :type => :request do

  it "displays the posts show page" do
    # get "/widgets/new"
    # expect(response).to render_template(:new)
    get "/users/2/posts/1"
    expect(response).to render_template(:show)

    # post "/widgets", :widget => {:name => "My Widget"}

    # expect(response).to redirect_to(assigns(:widget))
    # follow_redirect!

    # expect(response).to render_template(:show)
    # expect(response.body).to include("Widget was successfully created.")
  end

  # it "does not render a different template" do
  #   get "/widgets/new"
  #   expect(response).to_not render_template(:show)
  # end
end