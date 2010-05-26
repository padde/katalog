class User < ActiveRecord::Base
  has_many :credits
  has_many :items, :through => :credits
  
  has_many :memberships
  has_many :groups, :through => :memberships
end
