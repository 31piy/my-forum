class ApplicationController < ActionController::Base

  # Mock the logged in user.
  def current_user
    User.first
  end

end
