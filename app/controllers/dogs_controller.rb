class DogsController < ApplicationController
    #Create
    def new
        @dog = Dog.new
    end

    def create 
        @dog = Dog.new(dog_params)
        @dog.save
        redirect_to dog_path(@dog)
    end


    #Read
    def index
        @dogs = Dog.all 
    end

    def show
        @dog = Dog.find(params[:id])
        @employees = Employee.where(dog_id: @dog)
    end


    #Update
    def edit
        @dog = Dog.find(params[:id])
    end

    def update
        @dog = Dog.find(params[:id])
        @dog.update(dog_params)
        redirect_to dog_path(@dog)
    end


    #Delete

    def destroy
        @dog = Dog.find(params[:id])
    end

    #Strong Params

    def dog_params
        params.require(:dog).permit(:breed, :name, :age)
    end
end
