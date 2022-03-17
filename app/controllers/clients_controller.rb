class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        clients = Client.all
        render json: clients
    end

    def show
        client = Client.find(params[:id])
        render json: client, methods: [:total_charges]
    end

    def create
        client = Client.create(client_params)
        render json: client
    end


    private

    def client_params
        params.permit(:name, :age)
    end


    def record_not_found
        render json: {error: "Client not found"}, status: :not_found
    end

end
