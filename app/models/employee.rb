class Employee < ApplicationRecord
  belongs_to :dog

  validates :title, uniqueness: true
  validate :alias_is_unique

  def alias_is_unique
    every_alias = Employee.all.map {|employee| employee.alias}
    if self.alias == "none" || self.alias == ""
    elsif every_alias.include?(self.alias)
      errors.add(:alias, "Alias cannot be repeated.")
    else # if it's not include, we're ok
    end
  end
end
