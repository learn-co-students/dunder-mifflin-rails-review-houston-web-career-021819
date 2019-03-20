class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save
      redirect_to (employee_path(@employee))
    else #not valid
      @dogs = Dog.all
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @dogs = Dog.all
  end

  def update
    @employee = Employee.update(employee_params)
    redirect_to (employee_path(@employee))
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.delete
    redirect_to (employees_path)
  end


  private

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
