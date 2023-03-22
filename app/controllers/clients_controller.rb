class ClientsController < ApplicationController
  def index
    @clients = Client.includes(:user).order("created_at DESC")
  end

  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  private 

  def client_params
    params.require(:client).permit(:client_name, :postcode, :prefecture_id, :city, :block, :building, :phone, :pic).merge(user_id: current_user.id)
  end
end
