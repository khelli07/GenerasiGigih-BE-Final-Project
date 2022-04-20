class ApplicationController < ActionController::Base

  def render_invalid_request
    render inline:"<h1>400 Bad Request</h1>"
    :status => :bad_request
  end

  def render_error(error)
    render inline:"<h2><=% error %></h2>"
  end
end
