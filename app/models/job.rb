class Job < ApplicationRecord
    validates_presence_of :title
    validates_presence_of :description
    validates :starting_base_salary_range, numericality: { greater_than: 0 }
end
