class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end 

    def show
        @employee = Employee.find(params[:id])
        @dogs = Dog.all.select {|dog| @employee.dog_id == dog.id}
    end

    def new
        @employee = Employee.new
        
    end

    def create
        @employee = Employee.new(employee_params(:first_name, :last_name, :alias, :title, :office))

        if @employee.valid?
            @employee.save
        else
            render :new
        end
    end 

    def edit
        @employee = Employee.find(params[:id])
    end 
 
    def update
        @employee = Employee.find(params[:id])
        @employee.assign_attributes(employee_params(:first_name, :last_name, :alias, :title, :office, :dog_id)) 
        redirect_to @employee
    end

    def employee_params(*args)
        params.require(:employee).permit(*args)
    end

end
