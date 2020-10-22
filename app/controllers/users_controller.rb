class UsersController < ApplicationController

  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_connections
    @user_contacts = current_user.contacts
  end

  def search
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
  
end
