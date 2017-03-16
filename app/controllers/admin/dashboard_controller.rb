class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['adminuser'], password: ENV['adminpass']

  def show
  end
end
