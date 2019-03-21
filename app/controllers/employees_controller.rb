class EmployeesController < ApplicationController
    #Create
    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create 
        @dogs = Dog.all
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end


    #Read
    def index
        @employees = Employee.all 
    end

    def show
        @employee = Employee.find(params[:id])
        @dog = Dog.find(@employee.dog_id)
    end


    #Update
    def edit
        @dogs = Dog.all
        @employee = Employee.find(params[:id])
    end

    def update
        @dogs = Dog.all
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
    end


    #Delete

    def destroy
        @employee = Employee.find(params[:id])
    end

    #Strong Params

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end
end
