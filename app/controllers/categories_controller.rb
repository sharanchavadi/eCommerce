class CategoriesController < ApplicationController

    #filters
    before_action :authenticate_user!, except: [:index, :show, :find_sub_categories]
    before_action :check_is_admin, except: [:index, :show, :find_sub_categories]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category].permit(:name))
		if @category.save
			redirect_to categories_path, notice: "Successfully created #{@category.name}"
		else
			render action: "new"
		end
	end

    def show
        begin
           @category = Category.find(params[:id])
           @products = @category.products  #Product.where('category_id = ?', @category.id)
        rescue ActiveRecord::RecordNotFound
           redirect_to categories_path, notice: "Record not found"
       end
    end

    def edit
    	@category = Category.find(params[:id])
    end

    def update
    	@category = Category.find(params[:id])
    	previous_name = @category.name
    	if @category.update_attributes(params[:category].permit(:name))
    		redirect_to category_path(@category.id), notice: "Successfully updated from #{previous_name} to #{@category.name}"
    	else
    		render action: "edit"
    	end
    end
    
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path, notice: "Successfully deleted #{@category.name}"
    end

    def find_sub_categories
        @sub_categories = SubCategory.where('category_id = ?', params[:category_id])
    end

end
