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

		render 'show.html.erb'
	end
end
