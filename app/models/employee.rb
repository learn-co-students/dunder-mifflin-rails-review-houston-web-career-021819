class Employee < ApplicationRecord
    belongs_to :dog
    validates :title, uniqueness: true
    validate :aliases

    def aliases
        unless self.alias == "none"
            if Employee.find_by(alias: self.alias) == true && Employee.find_by(alias: self.alias) != self
                self.errors.add(:alias, "No two employees can have the same alias")
            end
        end
    end

end
