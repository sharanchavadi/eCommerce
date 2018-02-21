class ProductsController < ApplicationController

    #filters
    before_action :authenticate_user!, except: [:index, :show]
    before_action :check_is_admin, except: [:index, :show]
    
	def index
		@products = Product.all
	end

	def new
        @product = Product.new
    end


    def create
    	@product = Product.new(product_params)

    	if @product.save
    		redirect_to product_path(@product.id), notice: "Successfully created #{@product.name}"
    	else
    		render action: "new"
    	end
    end 


    def show
        
        @cart_line_item = CartLineItem.new 

        begin
           @product = Product.find(params[:id])
           @review = Review.new
        rescue ActiveRecord::RecordNotFound
           redirect_to products_path, notice: "Record not found"
       end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        previous_name = @product.name
        if @product.update_attributes(product_params)
            redirect_to product_path(@product.id), notice: "Successfully updated"
        else
            render action: "edit"
        end
    end
    
    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path, notice: "Successfully deleted #{@product.name}"
    end

    private
    #strong parameters /safe guard from mass assignment
    def product_params
       params[:product].permit(:name, :description, :price, :stock, :code_eligibility, :category_id, :image_url, :sub_category_id)
    end

end
