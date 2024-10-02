class Section < ApplicationRecord

  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
  
  #validations
  validates_presence_of :page_id
  validates_presence_of :name
  validates_presence_of :content
  validates_presence_of :content_type

   # Named scopes
   scope :visible, lambda { where( :visible => true ) } 
   scope :invisible, lambda{ where( :visible => false ) }
   scope :sorted, lambda { order("sections.position ASC") }
   scope :newest_first, lambda { order("sections.created_at DESC") }
   scope :search, lambda {|query|  
     where(["name LIKE ?", "%#{query}%"])
   }
end
