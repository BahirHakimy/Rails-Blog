require_relative '../models/user'

class UsersController < ApplicationController
  layout 'main'
  before_action :authenticate_user!

  def index
    @users = User.includes(:posts)
  end

  def show
    @user = User.find(params[:id])
  end
end
