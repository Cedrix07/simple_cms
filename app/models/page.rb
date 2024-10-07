class Page < ApplicationRecord

  # pages belongs to subject
  belongs_to :subject
  # pages has many sections
  has_many :sections
  # pages has many editors
  has_and_belongs_to_many :editors, :class_name => "AdminUser"
  acts_as_list :scope => :subject 

  # callbacks
  before_validation :add_default_permalink
  after_save :touch_subject 
  after_destroy :delete_related_sections

  # validation
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


  private 
  
  # Set the permalink to a default value if it is not already set.
  # The default value is the id and parameterized name joined by a dash.
     def add_default_permalink 
      if permalink.blank?
        self.permalink = "#{id}-#{name.parameterize}" 
      end
     end

  # Call subject.touch to update the timestamp for the subject
     def touch_subject
      subject.touch
     end

     def delete_related_sections
        self.sections.each do |section|
          section.destroy
        end
     end
end
