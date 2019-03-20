class DogsController < ApplicationController
    def index
        @dogs = Dog.all.sort_by { |dog | dog.employees.length }
    end

    def show
        @dog = Dog.find(params[:id])
    end

end
