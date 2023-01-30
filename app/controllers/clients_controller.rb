class ClientsController < ApplicationController
  
  def index
    clients = Client.all
    render json: clients, methods: [:total_amount_memberships]
  end

  def show
    client = Client.find_by_id(params[:id])
    if client
      render json: client, methods: [:total_amount_memberships]
    else 
      render json: { error: "Client not found" }, status: :not_found
    end
  end

  def update
    client = Client.find_by_id(params[:id])
    if client
      client.update(client_params)
      render json: client, status: :accepted
    else
      render json: { error: "Client not found" }, status: :not_found
    end
  end

  private
  def client_params
    params.require(:client).permit(:id, :name, :age)
  end
end
