class DogsController < ApplicationController
    def index
        @dogs = Dog.all
    end
    
    def new
        @employees = Employee.all
        @dog = Dog.new
    end

    def show
        @dog = Dog.find(params[:id])
        @employees = @dog.employees
    end

    def create
        @dog = Dog.create(dog_params)
        redirect_to dog_path(@dog)
    end

    

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end
end
