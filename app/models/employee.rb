class Employee < ApplicationRecord
  belongs_to :dog
  validates :alias, uniqueness: true, if: -> {alias_present}
  validates :title, uniqueness: true, if: -> {title_present}
  validates :first_name, presence: true
  validates :last_name, presence: true

  def alias_present
    if self.alias == "none" || self.alias == ""
      return false
    else
      return true
    end
  end

  def title_present
    if self.title == "none" || self.title == ""
      return false
    else
      return true
    end
  end
end
