class UsersController < ApplicationController

  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def connections
    @user_contacts = current_user.contacts
  end
  
end
