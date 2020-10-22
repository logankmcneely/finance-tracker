class ConnectionsController < ApplicationController

  def create
    byebug
  end

  def destroy
    contact = User.find(params[:id])
    connection = Connection.where(user_id: current_user.id, contact_id: contact.id).first
    connection.destroy
    flash[:notice] = "You have successfully unfollowed #{contact.full_name}."
    redirect_to my_connections_path
  end
  
end
