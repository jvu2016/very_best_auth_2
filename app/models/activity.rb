class Activity < ActiveRecord::Base

  has_many :locations , :class_name => "Location", :foreign_key => "activity_id"
  has_many :items , :class_name => "Item", :foreign_key => "activity_id"

end
