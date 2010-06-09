class Group < ActiveRecord::Base
  has_many :memberships
  has_many :people, :through => :memberships
  
  validates_presence_of :name
  validates_presence_of :description
end
