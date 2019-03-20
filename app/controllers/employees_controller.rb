class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end
    def new
        @employee= Employee.new
    end
    def create
        @employee = Employee.create(employee_params[:employee])
        redirect_to @employee
    end
    def show
        @employee = Employee.find(params[:id])
    end
    def edit
        @employee = Employee.find(params[:id])
    end
    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params[:employee])
        redirect_to @employee
    end
    def employee_params
        params.permit(employee: [:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url])
    end
end
