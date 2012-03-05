class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :init
  
  def init
  	@user = User.new
  end
end
