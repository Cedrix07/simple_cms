class Section < ApplicationRecord

  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
  acts_as_list :scope => :page

  after_save :touch_page
  #validations
  CONTENT_TYPES = ['text', 'HTML']
  # validates_presence_of :page_id
  validates_presence_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
  

   # Named scopes
   scope :visible, lambda { where( :visible => true ) } 
   scope :invisible, lambda{ where( :visible => false ) }
   scope :sorted, lambda { order("sections.position ASC") }
   scope :newest_first, lambda { order("sections.created_at DESC") }
   scope :search, lambda {|query|  
     where(["name LIKE ?", "%#{query}%"])
   }

  private
   def touch_page
    page.touch
   end

end
