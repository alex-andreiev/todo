# frozen_string_literal: true

class LocalesController < ApplicationController
  skip_before_action :authenticate_user!

  def update
    session[:locale] = params[:id]
    redirect_back_or_to(root_path)
  end
end
