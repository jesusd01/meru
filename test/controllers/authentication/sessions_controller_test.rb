require "test_helper"

class Authentication::SessionsControllerTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:test)
    end

    test "when the email and password are correct" do
        post sessions_url, params: {email: @user.email, password: 'test' }

        assert_response :success
    end

    test "when the password is incorrect" do
        post sessions_url, params: {email: @user.email, password: 'wrongpassword' }

        assert_response :unprocessable_entity
    end
end