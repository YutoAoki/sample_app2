require 'rails_helper'
include SessionsHelper

RSpec.describe TopicsController, type: :controller do
  describe "#new" do
    before do
      @user = FactoryBot.create(:user)
    end

    context "as a authenticated user" do
      it "responds successfully" do
        log_in(@user)
        get :new
        expect(response).to be_success
      end
    end

    context "as a guest user" do
      it "redirect to root path" do
        get :new
        expect(response).to redirect_to login_path
      end

      it "returns 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end
    end
  end

  describe "#create" do
    before do
      @user = FactoryBot.create(:user)
    end

    context "as a authenticated user" do
      it "adds a topic" do
        topic_params = FactoryBot.attributes_for(:topic)
        log_in(@user)
        expect {
          post :create, params: { topic: topic_params }
        }.to change(@user.topics, :count).by(1)
      end
    end

    context "as a guest user" do
      it "redirects to the login path" do
        topic_params = FactoryBot.attributes_for(:topic)
        post :create, params: { topic: topic_params }
        expect(response).to redirect_to login_path
      end
    end
  end
end
