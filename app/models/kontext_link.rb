class KontextLink < ActiveRecord::Base
  belongs_to :kontext
  belongs_to :kontextable, :polymorphic => true
end
