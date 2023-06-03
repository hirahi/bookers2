class HomesController < ApplicationController
  def top
    
  end

  def create
    
    home = Home.new(home_params)
    
    home.save
    
    flash[:notice] = "Signed out successfully."
    redirect_to root_path(home.id)
  end
end
