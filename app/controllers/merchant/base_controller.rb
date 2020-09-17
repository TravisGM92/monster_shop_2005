class Merchant::BaseController < ApplicationController
  before_action :require_merchant_employee

  private
  def require_merchant_employee
    render file: "/public/404" unless current_merchant_employee?
  end
end
