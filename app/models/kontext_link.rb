class KontextLink < ActiveRecord::Base
  belongs_to :kontext
  belongs_to :kontextable, :polymorphic => true
  
  belongs_to :thing, :class_name => 'Thing', :foreign_key => 'kontextable_id'
end
