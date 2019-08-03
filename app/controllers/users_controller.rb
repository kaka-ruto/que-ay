class UsersController < ApplicationController
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
  end
end
