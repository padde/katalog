class Membership < ActiveRecord::Base
  belongs_to :people
  belongs_to :group
  
  validates_presence_of :group_id
  validates_presence_of :person_id
  validates_presence_of :role
end
