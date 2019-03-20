    
class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
        # @dog_names = @dogs.map {|d| d.name}
    end
    
    def show
        @employee = Employee.find(params[:id])
        @dog = Dog.find(@employee.dog_id)
        
    end

    def create
        employee = Employee.create(employee_params)
        employee.save
        redirect_to employee_path(employee)
    end

    def edit
        @dogs = Dog.all
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        @employee.save
        redirect_to employee_path(@employee)
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
    
end
