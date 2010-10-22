class Kontext < ActiveRecord::Base
  acts_as_nested_set :order => 'name'
  
  has_many :kontext_links
  has_many :kontextables, :through => :kontext_links
  
  has_many :things, :through => :kontext_links, :source => :thing,
                    :conditions => "kontext_links.kontextable_type = 'Thing'"
                    
  scope :root_elements, where( :parent_id.eq % 0 )
end
