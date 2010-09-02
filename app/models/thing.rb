class Thing < ActiveRecord::Base
  has_many :credits, :dependent => :destroy
  has_many :people, :through => :credits
  accepts_nested_attributes_for :credits, :allow_destroy => true
  
  has_many :images, :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  
  belongs_to :user
  
  has_many :kontext_links, :as => :kontextable
  has_many :kontexts, :through => :kontext_links
  
  validates_presence_of :title, :description, :credits
  validates_associated :credits, :images
  
  attr_accessible :title, :description, :credits_attributes, :images_attributes, :kontext_ids, :license
  
  scope :asc, order('title')
end
