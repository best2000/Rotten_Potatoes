Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '45aab00c918b11893848', '3326b823c1f7819fa8dd2d3144433e1fb6ff06a4', scope: "read:user,user:email"
    provider :twitter, '39cBN01h3AoAjLfS6kYLCaXZF', 'nFKhybibS1CkYDHVZsPwnni6BaHMEBNOKhqf02zEJ57X6ieDxU'
  end