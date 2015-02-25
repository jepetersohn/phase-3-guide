class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def authenticate_user!
    redirect_to new_session_path unless current_user.present?
  end
end

class ListsController < ApplicationController
  before_filter :authenticate_user!
  def index
    # scenario 1
    @lists = List.all

    # scenario 2
    @lists = current_user.lists
  end
end


describe ListsController do
  context "#index" do
    it "user must be authenticated" do
      get :index
      expect(current_path).to eq new_session_path
    end
    it "assigns List.all (scenario 1)" do
      controller.stub(:authenticate_user!) { true }
      expect(assigns(:lists)).to eq List.all
    end
    it "assigns current_user.lists (scenario 2)" do
      user = FactoryGirl.create :user
      user.lists = [1, 2, 3]
      login user
      expect(assigns(:lists)).to eq user.lists
    end
  end
end


module AuthenticationHelper
  def login user
    ApplicationController.any_instance.stub(:current_user) { user }
  end
end
