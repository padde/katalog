class Group < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :people, :through => :memberships
  accepts_nested_attributes_for :memberships, :allow_destroy => true
  
  has_many :images, :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  
  validates_associated :memberships, :images
  
  belongs_to :user
  
  validates_presence_of :name, :description
  validates_format_of :website_url, :with => %r{^((http|https)://)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?/.*)?$|^$}ix, :allow_nil => true
  
  attr_accessible :name, :description, :website_url, :images_attributes, :memberships_attributes
  
  scope :asc, order('name')
end
