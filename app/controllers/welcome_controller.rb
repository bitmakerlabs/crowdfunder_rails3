class WelcomeController < ApplicationController
  
  def index
  end

  protected

  def nav_state
  	@nav = :home
  end
  
end
