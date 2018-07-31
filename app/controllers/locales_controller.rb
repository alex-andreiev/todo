class LocalesController < ApplicationController
  skip_before_action :authenticate_user!

  def update
    session[:locale] = params[:id]
    redirect_back fallback_location: root_path
  end
end
