require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of goal's required fields" do
        post :create, params: { goal: { title: "jack_bruce@place.com", user_id: "" } }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects user to user's show page on success" do
        debugger
        user = User.create(username: 'toby7', password: 'password')
        goal = Goal.create(title: "jack_bruce@place.com", user_id: user.id )
        post :create, params: { goal: { title: "jack_bruce@place.com", user_id: user.id } }
        # expect(response).to redirect_to(users_url)
        expect(response).to redirect_to(goal_url(goal))
      end
    end
  end
end
