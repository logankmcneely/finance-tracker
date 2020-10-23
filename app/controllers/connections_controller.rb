class ConnectionsController < ApplicationController

  def create
    new_connection = Connection.new(user_id: current_user.id, contact_id: params[:contact])
    if new_connection.save
      contact = User.find(params[:contact])
      flash[:notice] = "You have successfully started following #{contact.full_name}."
    else
      flash[:alert] = "Something went wrong."
    end
    redirect_to my_connections_path
  end

  def destroy
    contact = User.find(params[:id])
    connection = Connection.where(user_id: current_user.id, contact_id: contact.id).first
    connection.destroy
    flash[:notice] = "You have successfully unfollowed #{contact.full_name}."
    redirect_to my_connections_path
  end
  
end
