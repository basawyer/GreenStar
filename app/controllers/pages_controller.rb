class PagesController < ApplicationController
  def home
    @title = "Home"
  end
  
  def signin
    @title = "Sign In"
  end

  def contact
  end

end
