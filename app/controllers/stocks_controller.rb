class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/stock_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search"
          format.js { render partial: 'users/stock_result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js { render partial: 'users/stock_result' }
      end
    end
  end

  def refresh_tracked_stocks
    @user = User.find(params[:user_id])
    respond_to do |format|
      flash.now[:alert] = "Please enter a symbol to search"
      format.js { render partial: 'users/refresh_tracked_stocks' }
    end
  end

end
