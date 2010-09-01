class Context < ActiveRecord::Base
  acts_as_tree :order => 'name'
  
  scope :root_elements, where(:parent_id.eq % nil)
end
