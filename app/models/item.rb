class Item < ActiveRecord::Base
  has_many :credits
  has_many :users, :through => :credits
end
