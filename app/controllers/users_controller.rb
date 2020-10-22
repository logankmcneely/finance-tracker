class UsersController < ApplicationController

  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_connections
    @user_contacts = current_user.contacts
  end

  def search
    if params[:user].present?
      @user = params[:user]
      if @user
        respond_to do |format|
          format.js { render partial: 'users/user_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "No users found"
          format.js { render partial: 'users/user_result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a user to search"
        format.js { render partial: 'users/user_result' }
      end
    end
  end
  
end
