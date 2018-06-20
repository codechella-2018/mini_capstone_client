class Client::OrdersController < ApplicationController
	def show
		order_id = params[:id]
		response = Unirest.get("http://localhost:3000/api/orders/#{order_id}")
		@order = response.body
		render 'show.html.erb'
	end

	def create
		@order = Unirest.post("http://localhost:3000/api/orders").body

		flash[:success] = "Successfully created order!"
		redirect_to "/client/orders/#{@order['id']}"
	end
end
