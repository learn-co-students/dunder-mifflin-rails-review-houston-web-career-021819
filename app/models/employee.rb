class Employee < ApplicationRecord
    belongs_to :dog
    validates :alias, uniqueness: {scope: :id}
    validates :title, uniqueness: true
end
