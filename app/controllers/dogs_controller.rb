class DogsController < ApplicationController
    def index
        @dogs = Dog.all
    end
    def new
        @dog = Dog.new
    end
    def create
        @dog = Dog.create(dog_params[:dog])
        redirect_to @dog
    end
    def show
        @dog = Dog.find(params[:id])
    end
    def edit
        @dog = Dog.find(params[:id])
    end
    def update
        @dog = Dog.find(params[:id])
        @dog.update(dog_params[:dog])
        redirect_to @dog
    end
    def dog_params
        params.permit(dog: [:name, :breed, :age])
    end
end
