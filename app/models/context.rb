class Context < ActiveRecord::Base
  acts_as_tree :order => 'name'
end
