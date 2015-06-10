class Item < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  belongs_to :item
  has_many :favorites
end
