class Kontext < ActiveRecord::Base
  acts_as_tree :order => 'name'
  
  has_many :kontext_links
  has_many :kontextables, :through => :kontext_links
end
