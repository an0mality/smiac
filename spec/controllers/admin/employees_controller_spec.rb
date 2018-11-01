require 'rails_helper'
# require 'support/controller_employees.rb'

RSpec.describe Admin::EmployeesController, type: :controller do

  # login_admin

  it "should get index" do
    user = FactoryGirl.create(:user)
    sign_in user
    get 'index'
    expect(response).to be_success
  end

  it "should have a current_user" do
    user = FactoryGirl.create(:user)
    sign_in user
    expect(subject.current_user).to_not eq(nil)
  end

  it "creates a new employees" do
    # user = FactoryGirl.create(:user)
    # sign_in user
    @employee = FactoryGirl.create(:employees)
    expect { post :create, :employees => @employee }.to change(Employee, :count).by(1)
  end

  it "redirects to the new employees" do
    post :create, contact: FactoryGirl.attributes_for(:employees)
    expect(response).to redirect_to root_url
  end




end
