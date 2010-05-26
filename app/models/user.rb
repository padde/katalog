class User < ActiveRecord::Base
  has_many :credits
  has_many :items, :through => :credits
end
