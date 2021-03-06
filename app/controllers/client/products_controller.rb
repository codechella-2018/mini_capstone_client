class Client::ProductsController < ApplicationController
  def index
    client_params = {
      search: params[:search],
      price_sort: params[:price_sort],
      category: params[:category]
    }
    response = Unirest.get("http://localhost:3000/api/products", parameters: client_params)
    @products = response.body
    render 'index.html.erb'
  end

  def new
    @product = {
     "name" => params[:name],
     "price" => params[:price],
     "description" => params[:description],
     "supplier_id" => params[:supplier_id]
    }
    render 'new.html.erb'
  end

  def create
    @product = {
     "name" => params[:name],
     "price" => params[:price],
     "description" => params[:description],
     "supplier_id" => params[:supplier_id]
    }

    p "THIS IS @PRODUCT================ #{@product}"

    # client_params = {
    #   name: params[:name],
    #   price: params[:price],
    #   description: params[:description],
    #   supplier_id: params[:supplier_id]
    # }

    response = Unirest.post(
      "http://localhost:3000/api/products",
      parameters: @product
      )

    if response.code == 200
      flash[:success] = "Successfully created Product"
      redirect_to "/client/products/"
    else
      @errors = response.body['errors']
      render 'new.html.erb'
    end
  end

  def show
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render 'show.html.erb'
  end

  def edit
    response = Unirest.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = response.body
    render 'edit.html.erb'
  end

  def update
    @product = {
     "id" => params[:id], 
     "name" => params[:name],
     "price" => params[:price],
     "description" => params[:description],
     "supplier_id" => params[:supplier_id]
    }

    response = Unirest.patch(
      "http://localhost:3000/api/products/#{params[:id]}",
      parameters: @product
    )

    if response.code == 200
      flash[:success] = "Successfully updated Product"
      redirect_to "/client/products/#{params[:id]}"
    else
      @errors = response.body['errors']
      render 'edit.html.erb'
    end
  end

  def destroy
    response = Unirest.delete("http://localhost:3000/api/products/#{params['id']}")
    flash[:success] = "Successfully destroyed product"
    redirect_to "/client/products"
  end
end