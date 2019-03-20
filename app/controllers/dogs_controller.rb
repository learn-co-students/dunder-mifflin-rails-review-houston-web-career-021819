class DogsController < ApplicationController

  def index
    unsorted_dogs = Dog.all
    @dogs = unsorted_dogs.sort_by { |dog| dog.employees.length }.reverse
  end

  def show
    @dog = Dog.find(params[:id])
  end





end
