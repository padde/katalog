class Membership < ActiveRecord::Base
  belongs_to :person
  belongs_to :group
  
  validates_presence_of :person
  validates_uniqueness_of :person_id, :scope => :group_id
  
  attr_accessible :person_id
end
