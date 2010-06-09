class Credit < ActiveRecord::Base
  belongs_to :person
  belongs_to :thing
  
  validates_presence_of :person_id
  validates_presence_of :thing_id
end
