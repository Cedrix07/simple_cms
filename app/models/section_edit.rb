class SectionEdit < ApplicationRecord

  # relation
  belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
  belongs_to :section
  
   # Named scopes
   scope :visible, lambda { where( :visible => true ) } 
   scope :invisible, lambda{ where( :visible => false ) }
   scope :sorted, lambda { order("sections.position ASC") }
   scope :newest_first, lambda { order("sections.created_at DESC") }
   scope :search, lambda {|query|  
     where(["name LIKE ?", "%#{query}%"])
   }

end
