module GoogleOauthMockHelper
  def google_oauth_mock
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] =
      OmniAuth::AuthHash.new(
        provider: 'google_oauth2',
        uid: 123_456_789,
        info: {
          name: 'John Doe',
          email: 'john.doe@example.com',
          first_name: 'John',
          last_name: 'Doe'
        },
        credentials: {
          token: 'token'
        }
      )
  end
end
