class ClientsController < ApplicationController

  def index
    clients = Client.all
    render json: clients, status: :ok
  end

  def show
    client = Client.find(params[:id])
    render json: client, status: :ok
  end

  def update
    client = Client.find(params[:id])
    client.update!(client_params)
    render json: client, status: :ok
  end

  private

  def client_params
    params.permit(:name, :age)
  end
end
