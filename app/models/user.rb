class User < ActiveRecord::Base
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable
  
  has_many :people
  accepts_nested_attributes_for :people
  
  attr_accessible :email, :password, :password_confirmation, :username, :people_attributes
  
  validates_uniqueness_of :username
  validates_presence_of   :username
  
  
  # Enable Login with username OR email
  def self.find_for_authentication(conditions={})
    unless conditions[:email] =~ /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i # email regex
      conditions[:username] = conditions.delete("email")
    end
    super
  end
end
