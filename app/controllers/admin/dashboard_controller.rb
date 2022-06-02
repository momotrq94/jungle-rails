class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'].to_s, password: ENV['PASSWORD'].to_s
  def show
    @products = Product.count
    @categories = Category.count
  end
end
