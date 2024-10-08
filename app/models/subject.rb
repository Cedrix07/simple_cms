class Subject < ApplicationRecord

  #relation subject has many pages 
  has_many:pages
  acts_as_list
  
  #validations 
  validates_presence_of :name, message: "is required"
  validates_length_of :name, maximum: 255 


  # Named scopes
  scope :visible, lambda { where( :visible => true ) } 
  scope :invisible, lambda{ where( :visible => false ) }
  scope :sorted, lambda { order("subjects.position ASC") }
  scope :newest_first, lambda { order("subjects.created_at DESC") }
  scope :search, lambda {|query|  
    where(["name LIKE ?", "%#{query}%"])
  }


end
