require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "renders :new" do
      get new_user_path

      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    it "creates a new user and redirects to first question's path" do
      questions = create_list(:question, 2)

      post "/users", params: { user: { email: 'new.user@email.com' } }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(questions.first)
    end
  end
end
