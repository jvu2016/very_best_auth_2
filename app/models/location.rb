class Location < ActiveRecord::Base
  validates :city, :presence => true, :uniqueness => { :scope => :city }

belongs_to :activity
  # has_many :activities
  has_many :favorites, :through => :locations
end
