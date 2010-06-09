class Thing < ActiveRecord::Base
  has_many :credits
  has_many :people, :through => :credits
  
  validates_presence_of :title
  validates_presence_of :description
end
