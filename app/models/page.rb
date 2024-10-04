class Page < ApplicationRecord

  # relation 
  
  # pages belongs to subject
  belongs_to :subject
 
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"
  acts_as_list :scope => :subject 
  # validations
  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255
  # validates_presence_of :permalink
  # validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  # validates_uniqueness_of :permalink
  #for unique values by use ":scope => :subject_id"

  validates :name, :presence => true, :length => {maximum: 255}
  validates :permalink, :length => {within:3..255}, :uniqueness => true 

  #Named scopes
  scope :visible, lambda { where( :visible => true ) } 
  scope :invisible, lambda{ where( :visible => false ) }
  scope :sorted, lambda { order("pages.position ASC") }
  scope :newest_first, lambda { order("pages.created_at DESC") }
  scope :search, lambda {|query|  
    where(["name LIKE ?", "%#{query}%"])
  }


end
