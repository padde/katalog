class Person < ActiveRecord::Base
  has_many :credits
  has_many :things, :through => :credits
  
  has_many :accounts
  has_many :users, :through => :accounts
  
  validates_presence_of :first_name, :last_name
  
  def full_name 
    "#{first_name} #{last_name}"
  end
end
