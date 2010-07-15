class Person < ActiveRecord::Base
  has_many :credits
  has_many :things, :through => :credits
  
  belongs_to :user
  
  validates_presence_of :first_name, :last_name
  
  attr_accessible :first_name, :last_name
  
  scope :asc, order('last_name')
  scope :by_user, lambda { |user| where( :user_id.eq % user.id ) }
  
  def full_name 
    "#{first_name} #{last_name}"
  end
end
