class SubCategoriesController < ApplicationController

    #filters
    before_action :authenticate_user!, except: [:index, :show]
    before_action :check_is_admin, except: [:index, :show]

	def index
		@sub_categories = SubCategory.all
	end

	def new
		@sub_category = SubCategory.new
	end

	def create
		@sub_category = SubCategory.new(sub_category_params)

    	if @sub_category.save
    		redirect_to sub_category_path(@sub_category.id), notice: "Successfully created #{@sub_category.name}"
    	else
    		render action: "new"
    	end
	end

	def show
		begin
           @sub_category = SubCategory.find(params[:id])
        rescue ActiveRecord::RecordNotFound
           redirect_to sub_categories_path, notice: "Record not found"
        end
	end

	def edit
		@sub_category = SubCategory.find(params[:id])
	end

	def update
		@sub_category = SubCategory.find(params[:id])
        previous_name = @sub_category.name
        if @sub_category.update_attributes(sub_category_params)
            redirect_to sub_category_path(@sub_category.id), notice: "Successfully updated"
        else
            render action: "edit"
        end
	end

	def destroy
		@sub_category = SubCategory.find(params[:id])
        @sub_category.destroy
        redirect_to sub_categories_path, notice: "Successfully deleted #{@sub_category.name}"
	end
    
    def sub_category_params
       params[:sub_category].permit(:name, :category_id)
    end

end
