class Department < ActiveRecord::Base
  
  attr_accessor :head_of_department_id
  before_save do |department|
    department.head_of_department = Person.find_by_id(head_of_department_id)
  end
  
  has_many :study_modules
  has_one :head_of_department, :class_name => 'Person'
  
  scope :asc, order('name')
end
