class Membership < ActiveRecord::Base
  belongs_to :people
  belongs_to :group
  
  validates_presence_of :group_id, :person_id, :role
end
