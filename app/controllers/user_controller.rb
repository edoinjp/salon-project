class UserController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
