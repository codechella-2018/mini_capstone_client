class Client::CartedProductsController < ApplicationController

	def index
		@carted_products = Unirest.get("http://localhost:3000/api/carted_products").body
		render 'index.html.erb'
	end

	def create
		client_params = {
			product_id: params[:product_id],
			quantity: params[:quantity]
		}
		@carted_product = Unirest.post("http://localhost:3000/api/carted_products", parameters: client_params).body

		redirect_to "/client/carted_products"
	end

	def destroy
		carted_product_id = params[:id]
		response = Unirest.delete("http://localhost:3000/api/carted_products/#{carted_product_id}")
		flash[:success] = "Successfully removed product from cart"
		redirect_to "/client/carted_products"
	end
end









