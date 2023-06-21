require_relative '../models/user'

class UsersController < ApplicationController
  def index
    puts 'Hello'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
