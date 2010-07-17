class Image < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  
  has_attached_file :data, :styles => {
    :thumb => "100x100#",
    :medium => "640x1200>",
    :large => "1200x1200>"
  }
  
  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 5.megabytes
  validates_attachment_content_type :data, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
