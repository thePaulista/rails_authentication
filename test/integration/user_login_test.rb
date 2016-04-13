require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(username: "piper", password: "password")

    visit login_path

    fill_in "Username", with: "piper" #user.username
    fill_in "Password", with: "password" #cannot do user.password b/c of digest
    click_button "Login"

    assert page.has_content?("Welcome, piper")
  end
end
