class DogsController < ApplicationController

    def index
        @dogs = Dog.all.sort_by{|dog| dog.employees.length}
       
    end

    def show
        @dog = Dog.find(params[:id])
        @employees = Employee.all.select {|employee| employee.dog_id == @dog.id}
    end

    def new
        @dog = Dog.new
    end
 
    def create
        @dog = Dog.create(dog_params(:name, :breed, :age))
        redirect_to dogs_path
    end

    def edit
        @dog = Dog.find(params[:id])
    end 

    def update
        @dog = Dog.find(params[:id])
        @dog.update(dog_params(:name, :breed, :age)) 
        redirect_to @dog
    end

    def dog_params(*args)
        params.require(:dog).permit(*args)
    end
end

