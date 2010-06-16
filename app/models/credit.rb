class Credit < ActiveRecord::Base
  belongs_to :person
  belongs_to :thing
  
  validates_presence_of :person_id, :thing_id, :role
end
