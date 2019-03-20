class Dog < ApplicationRecord
  has_many :employees
  
  def self.sorted_dogs
    Dog.all.sort_by{|dog| dog.employees.size}.reverse
  end

  def my_employees
    Employee.all.select{|employee| employee.dog == self}
  end
end
