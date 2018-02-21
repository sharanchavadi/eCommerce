class AddressesController < ApplicationController
    
    before_action :authenticate_user!
    def index
		@addresses = Address.all
	end

	def new
        @address = Address.new
    end


    def create
    	@address = Address.new(address_params)

    	if @address.save
    		redirect_to address_path(@address.id), notice: "Successfully created #{@address.title} address"
    	else
    		render action: "new"
    	end
    end 


    def show
        
        begin
           @address = Address.find(params[:id])
        rescue ActiveRecord::RecordNotFound
           redirect_to addresses_path, notice: "Record not found"
       end
    end

    def edit
        @address = Address.find(params[:id])
    end

    def update
        @address = Address.find(params[:id])
        previous_name = @address.title
        if @address.update_attributes(address_params)
            redirect_to address_path(@address.id), notice: "Successfully updated"
        else
            render action: "edit"
        end
    end
    
    def destroy
        @address = Address.find(params[:id])
        @address.destroy
        redirect_to addresses_path, notice: "Successfully deleted #{@address.title}"
    end

    private
    #strong parameters /safe guard from mass assignment
    def address_params
       params[:address].permit(:user_id, :street, :city, :pin, :title)
    end

end
