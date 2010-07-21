class User < ActiveRecord::Base
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable
  
  has_one :person
  accepts_nested_attributes_for :person
  
  has_many :things
  
  attr_accessible :email, :password, :password_confirmation, :username, :person_attributes
  
  validates :username, :presence => true, :uniqueness => true
  
  # Enable Login with username OR email
  def self.find_for_database_authentication(conditions={})
    self.where(:username.matches % conditions[:email]).limit(1).first ||
    self.where(:email.eq % conditions[:email]).limit(1).first
  end
  
  def owns_thing? (thing)
    thing.user == self
  end
  
  def owns_group? (group)
    group.members.include? self.person
  end
  
  def admin?
    self.admin
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
