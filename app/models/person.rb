class Person < ActiveRecord::Base
  has_many :credits
  has_many :items, :through => :credits
  
  has_many :memberships
  has_many :groups, :through => :memberships
  
  def full_name 
    "#{first_name} #{last_name}"
  end
end
