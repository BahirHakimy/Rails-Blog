require_relative '../models/user'

class UsersController < ApplicationController
  layout 'main'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
