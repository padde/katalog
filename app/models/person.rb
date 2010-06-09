class Person < ActiveRecord::Base
  has_many :credits
  has_many :things, :through => :credits
  
  has_many :memberships
  has_many :groups, :through => :memberships
  
  has_many :accounts
  has_many :users, :through => :accounts
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def full_name 
    "#{first_name} #{last_name}"
  end
end
