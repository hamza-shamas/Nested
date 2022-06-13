class SharksController < ApplicationController
    before_action :find_shark, only:[:show, :edit, :update, :destroy]
    
    def index
        @sharks = Shark.all.order("created_at DESC")
    end

    def new
        @shark = Shark.new
    end

    def create
        @shark = Shark.new(shark_params)
        if @shark.save
            redirect_to @shark
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @shark.update(shark_params)
            redirect_to @shark
        else
            render 'edit'
        end
    end
    
    def destroy
        @shark = Shark.find(params[:id])
        @shark.destroy
    end

    private

    def find_shark
        @shark = Shark.find(params[:id])
    end

    def shark_params
        params.require(:shark).permit(:name)
    end

end
