class UsersController < ApplicationController

  def my_portfolio
    @user = current_user.stocks
  end

  def my_connections
    @user_contacts = current_user.contacts
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    if params[:user].present?
      @results = User.search(params[:user])
      @results = current_user.except_current_user(@results)
      if !@results.empty?
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
