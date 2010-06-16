class Thing < ActiveRecord::Base
  has_many :credits, :dependent => :destroy
  has_many :people, :through => :credits
  
  accepts_nested_attributes_for :credits, :allow_destroy => true
  
  validates_presence_of :title, :description
end
