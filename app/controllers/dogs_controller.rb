class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    sorted = @dogs.sort_by do |dog|
      dog.employees.size
    end
    reverse_sorted = sorted.reverse
    @dogs_sorted = reverse_sorted
    #@dogs_sorted = Dog.sorted_dogs (skinny controller way)
  end

  def show
    @dog = Dog.find(params[:id])
    @my_employees = Employee.all.select{|employee| employee.dog == @dog}
    #@my_employees = @dog.my_employees (skinny controller way)
  end

end
