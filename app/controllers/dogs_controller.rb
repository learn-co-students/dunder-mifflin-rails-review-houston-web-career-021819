class DogsController < ApplicationController
    def index
        @dogs = Dog.all
        @dogs_sorted = 
    end
    
    def sort_with_employee_count
        
    end
    def new
        @employees = Employee.all
        @dog = Dog.new
    end

    def show
        @dog = Dog.find(params[:id])
        #@employees = Employee.select{|e| e.dog_id==@dog.id}

        @employees = @dog.employees
    end

    def create
        @dog = Dog.create(dog_params)
        redirect_to dog_path(@dog)
    end

    def edit
        @dog = Dog.find(params[:id])
    end

    def update
        @dog = Dog.find(params[:id])
        @dog.update(dog_params)
        redirect_to dog_path(@dog)
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end
end
