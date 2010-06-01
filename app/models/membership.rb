class Membership < ActiveRecord::Base
  belongs_to :people
  belongs_to :group
end
