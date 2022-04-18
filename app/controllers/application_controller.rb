class ApplicationController < ActionController::Base

  def render_invalid_request
    render inline:"<h1>400 Bad Request</h1>"
  end
end
