def set_omniauth_twitter(opts={})
   OmniAuth.config.test_mode = true

   OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :uid => '12345',
      :info => { :email => 'foo@example.com', :name => 'foo' }
   })
end
